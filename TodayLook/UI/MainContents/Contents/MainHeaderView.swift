//
//  MainHeaderView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/17.
//

import SwiftUI

struct MainHeaderView: View {
    @Binding var isPresentedSheet: Bool
    @Binding var isPresentedLeft: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isPresentedSheet = false
                isPresentedLeft = true
            }, label: {
                Image("Menu")
            })
            Spacer()
            Text("타이틀")
            Spacer()
            Button(action: {
                print("Bookmark")
            }, label: {
                Image("Menu")
            })
        }
        .background(.clear)
    }
}

//#Preview {
//    MainHeaderView()
//}
