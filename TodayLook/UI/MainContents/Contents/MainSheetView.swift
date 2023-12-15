//
//  MainSheetView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/05.
//

import SwiftUI

struct MainSheetView: View {
    var body: some View {
        ScrollView {
            ForEach(1...30, id: \.self) { index in
                WeeklyWeatherView()
            }
        }
    }
}

#Preview {
    MainSheetView()
}
