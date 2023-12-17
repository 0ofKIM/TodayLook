//
//  MainContentView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/12.
//

import SwiftUI
import ComposableArchitecture

struct MainContentView: View {
    let store: StoreOf<MainContentFeature>
    let columns = [GridItem(.flexible())]
    
    @State private var settingViewX: CGFloat = 0
    
    @State private var isPresentedSheet: Bool = true
    @State private var isPresentedLeft: Bool = false

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged {
                let isLeftDrag = $0.translation.width < 0
                
                if isLeftDrag { settingViewX = $0.translation.width }
            }
            .onEnded {
                let isExitView = $0.translation.width < -100
                
                if isExitView {
                    isPresentedSheet = true
                    isPresentedLeft = false
                }
                settingViewX = 0
            }
        
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                NavigationView {
                    ZStack(alignment: .leading) {
                        ScrollView(.vertical) {
                            LazyVGrid(columns: columns, alignment: .center) {
                                MainHeaderView(isPresentedSheet: $isPresentedSheet, isPresentedLeft: $isPresentedLeft)
                                MainView()
                            }
                        }
                        .sheet(isPresented: $isPresentedSheet) {
                            MainSheetView()
                                .padding(.top, 30)
                                .presentationDetents([.height(300), .height(700)])
                                .presentationDragIndicator(.visible)
                                .presentationCornerRadius(30)
                                .interactiveDismissDisabled()
                                .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
                        }
                        .onAppear { //navigation back
                            print("ddd")
                            isPresentedSheet = true
                            isPresentedLeft = false
                        }
                        
                        if isPresentedLeft {
                            ZStack(alignment: .leading) {
                                Color.black.opacity(0.3)
                                    .ignoresSafeArea()
                                
                                SettingView()
                                    .frame(width: geometry.size.width*4/5, height: geometry.size.height)
                                    .background(Color.red)
                                    .offset(x: settingViewX)
                            }
                        }
                    }
                    .gesture(dragGesture)
                }
            }
        }
    }

    //미사용
    var testButton: some View {
        Button("(Test) Weather Change") {
            store.send(.testTapped)
        }
        .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
        .background(.red)
    }
}

enum Weather {
    case sunny
    case rain
}

struct MainContentFeature: Reducer {
    struct State: Equatable {
        var weather: Weather
    }
    
    enum Action {
        case testTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .testTapped:
                if state.weather == .rain {
                    state.weather = .sunny
                } else {
                    state.weather = .rain
                }
                print("current weather = \(state.weather)")
                return .none
            }
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        let state: MainContentFeature.State = MainContentFeature.State(weather: .sunny)

        MainContentView(
            store: Store(initialState: state) {
                MainContentFeature()
            }
        )
    }
}
