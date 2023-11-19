//
//  TodayLookApp.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/12.
//

import SwiftUI

@main
struct TodayLookApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("켜짐")
            case .inactive:
                print("꺼짐")
            case .background:
                print("백그라운드에서 돌아가는 중")
            @unknown default:
                fatalError()
            }
        }
    }
}
