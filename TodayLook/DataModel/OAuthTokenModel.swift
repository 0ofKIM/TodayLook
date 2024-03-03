//
//  OAuthTokenModel.swift
//  TodayLook
//
//  Created by 0ofKim on 2024/02/19.
//

import Foundation

struct OAuthTokenModel: Codable {
    var result: OAuthToken?
    var errMsg: String?
}

struct OAuthToken: Codable {
    var accessTimeout: String?
    var accessToken: String?
}
