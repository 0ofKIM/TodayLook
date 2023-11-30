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
                    MainView()
                    
                    ForEach(1...20, id: \.self) { value in
                        WeeklyWeatherView()
                    }
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
        }
    }

    var settingToolbarItem: ToolbarItem<(), Button<NavigationLink<Text, SettingView>>> {
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
    }

    var titleToolbarItem: ToolbarItem<(), HStack<Text>> {
        ToolbarItem(placement: .principal) {
            HStack {
                Text("Navigation Title")
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }

    var bookmarkToolbarItem: ToolbarItem<(), Button<NavigationLink<Text, BookmarkView>>> {
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
