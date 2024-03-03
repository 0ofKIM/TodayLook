//
//  ReverseGeoCodeModel.swift
//  TodayLook
//
//  Created by 0ofKim on 2024/02/06.
//

import Foundation

struct ReverseGeoCodeModel: Codable {
    var result: [ReverseGeoCode]?
}

struct ReverseGeoCode: Codable {
    var sido_nm: String?
    var sgg_nm: String?
}
