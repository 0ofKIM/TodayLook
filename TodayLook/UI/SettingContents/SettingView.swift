//
//  SettingView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/19.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                Text("위치 설정")
                    .font(Font.custom("Pretendard", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Gray08)
                
                Spacer()
                
                Button(action: {
                    print("Hi")
                }, label: {
                    HStack(alignment: .center, spacing: 0) {
                        Text("서울특별시 광진구")
                            .font(Font.custom("Pretendard", size: 16))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.Gray04)
                        Image("ChevronRight")
                    }
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            HStack(alignment: .top, spacing: 0) {
                Text("앱 정보")
                    .font(Font.custom("Pretendard", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Gray08)
                
                Spacer()
                
                Text("v 1.0")
                    .font(Font.custom("Pretendard", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Gray04)
            }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(.horizontal, 0)
        .padding(.top, 84)
        .padding(.bottom, 0)
        .frame(width: 296, height: 844, alignment: .topLeading)
        .background(Color.Gray01)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
