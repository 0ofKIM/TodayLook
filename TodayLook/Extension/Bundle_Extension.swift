//
//  Bundle_Extension.swift
//  TodayLook
//
//  Created by 0ofKim on 3/3/24.
//

import Foundation

extension Bundle {
    var SGI_SERVICE_ID: String {
        guard let file = self.path(forResource: "Property List", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["SGI_SERVICE_ID"] as? String else { fatalError("SGI_SERVICE_ID Error") }
        
        return key
    }
    
    var SGI_SECRET_KEY: String {
        guard let file = self.path(forResource: "Property List", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["SGI_SECRET_KEY"] as? String else { fatalError("SGI_SECRET_KEY Error") }
        
        return key
    }
}
