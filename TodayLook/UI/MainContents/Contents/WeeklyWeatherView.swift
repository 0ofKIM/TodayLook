//
//  WeeklyWeatherView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/29.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var body: some View {
        HStack(alignment: .center) {
            leftView
            Spacer()
            rightView
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 14)
        .frame(width: 350, alignment: .center)
        .background(Color.gray01)
        .cornerRadius(12)
    }

    var leftView: some View {
        HStack(alignment: .center) {
            Text("15일 (토)")
                .font(Font.custom("Pretendard", size: 14))
                .foregroundColor(.gray08)
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 24, height: 24)
                .background(
                    Image("Heavy Rain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
        }
        .padding(0)
        .frame(width: 100, alignment: .center)
    }

    var rightView: some View {
        HStack(alignment: .center) {
            Text("최저 20")
                .font(Font.custom("Pretendard", size: 14))
                .foregroundColor(.gray08)
            Spacer()
            Text("최고 27")
                .font(Font.custom("Pretendard", size: 14))
                .foregroundColor(.gray08)
        }
        .padding(0)
        .frame(width: 115, alignment: .center)
    }
}

#Preview {
    WeeklyWeatherView()
}
