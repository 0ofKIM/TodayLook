//
//  TestModel.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/28.
//

import Foundation

struct TestModel: Codable {
    var response: ResponseData?

    struct ResponseData: Codable {
        var header: ResponseHeader?
        var body: ResponseBody?

        struct ResponseHeader: Codable {
            var resultCode: String?
            var resultMsg: String?
        }

        struct ResponseBody: Codable {
            var dataType: String?
        }
    }
}
