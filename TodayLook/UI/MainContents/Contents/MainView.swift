//
//  MainView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/29.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text("메인 배너")
            .frame(width: UIScreen.main.bounds.width, height: 400)
            .background(Color.teal)
    }
}

#Preview {
    MainView()
}
