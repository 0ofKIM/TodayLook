//
//  Font_Extension.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/18.
//

import Foundation
import SwiftUI

extension Font {
    public static var H1 = Font.custom("Pretendard-Bold", size: 28)
    public static var H2 = Font.custom("Pretendard-SemiBold", size: 24)

    public static var Subtitle1 = Font.custom("Pretendard-SemiBold", size: 20)
    public static var Subtitle2 = Font.custom("Pretendard-SemiBold", size: 18)
    public static var Subtitle3 = Font.custom("Pretendard-SemiBold", size: 16)
    public static var Subtitle4 = Font.custom("Pretendard-SemiBold", size: 14)

    public static var Body1 = Font.custom("Pretendard-Regular", size: 16)
    public static var Body2 = Font.custom("Pretendard-Regular", size: 14)

    public static var Caption1 = Font.custom("Pretendard-Medium", size: 12)
    public static var Caption2 = Font.custom("Pretendard-Regular", size: 12)
    public static var Caption3 = Font.custom("Pretendard-SemiBold", size: 10)
}
