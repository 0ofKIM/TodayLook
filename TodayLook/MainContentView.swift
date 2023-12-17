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
    
    @State private var isPresentedSheet = true
    @State private var isPresentedLeft = false

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
                                MainView()
                            }
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            settingToolbarItem
                            titleToolbarItem
                            bookmarkToolbarItem
                        }
                        .toolbarBackground(.visible, for: .navigationBar)
                        .toolbarBackground(Color(uiColor: .systemBlue), for: .navigationBar)
                        .toolbarColorScheme(.light, for: .navigationBar)
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
                            SettingView()
                                .frame(width: geometry.size.width*4/5, height: geometry.size.height)
                                .background(Color.red)
                                .transition(.move(edge: .leading))
                                .offset(x: settingViewX)
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

    var settingToolbarItem: ToolbarItem<(), some View> {
        ToolbarItem(placement: .navigationBarLeading) {
            Button("설정") {
                withAnimation {
                    isPresentedSheet = false
                    isPresentedLeft = true
                }
            }
            .bold()
            .foregroundColor(.white)
        }
    }

    var titleToolbarItem: ToolbarItem<(), some View> {
        ToolbarItem(placement: .principal) {
            Text("Navigation Title")
                .bold()
                .foregroundColor(.white)
        }
    }

    var bookmarkToolbarItem: ToolbarItem<(), some View> {
        ToolbarItem(placement: .navigationBarTrailing) {
            let bookmarkView = BookmarkView().onAppear {
                isPresentedSheet = false
            }

            NavigationLink(destination: bookmarkView) {
                Text("즐겨찾기")
                    .bold()
                    .foregroundColor(.white)
            }
        }
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
