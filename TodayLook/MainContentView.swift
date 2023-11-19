//
//  MainContentView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/12.
//

import SwiftUI
import ComposableArchitecture

struct MainContentView: View {    
    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
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
