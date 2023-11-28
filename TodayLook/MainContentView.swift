//
//  MainContentView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/12.
//

import SwiftUI
import ComposableArchitecture

struct MainContentView: View {
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    Text("메인 배너")
                        .frame(width: UIScreen.main.bounds.width, height: 400)
                        .background(Color.teal)
                    
                    ForEach(1...60, id: \.self) { value in
                        Text(String(value))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Navigation Title")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {},
                        label: {
                            NavigationLink(destination: SettingView()) {
                                Text("설정")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    )
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {},
                        label: {
                            NavigationLink(destination: BookmarkView()) {
                                Text("즐겨찾기")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    )
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .systemBlue), for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
        }
        
    }
}

//struct MainContentFeature: Reducer {
//    struct State {
//        
//    }
//    
//    enum Action {
//        
//    }
//    
//    var body: Body {
//        
//    }
//}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
