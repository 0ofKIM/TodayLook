//
//  SettingView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/11/19.
//

import SwiftUI
import CoreLocation

struct SettingView: View {
    @State var area: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                Text("위치 설정")
                    .font(Font.custom("Pretendard", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.Gray08)
                
                Spacer()
                
                Button(action: {
                    getLocation()
                }, label: {
                    HStack(alignment: .center, spacing: 0) {
                        Text(area)
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
        .onAppear {
            getLocation()
        }
    }
}

extension SettingView {
    func getLocation() {
        // 위치 사용 권한 설정 확인
        let locationManager = CLLocationManager()
        let authorizationStatus = locationManager.authorizationStatus
        
        // 항상 허용 || 앱 사용 시 허용
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            let coordinate = locationManager.location?.coordinate
            let latitude = coordinate?.latitude ?? 0.0
            let longitude = coordinate?.longitude ?? 0.0
            
            APIClient.shared.fetchReverseGeocoding(x: longitude, y: latitude) { area in
                self.area = area
            }
        }
        
        // 권한 거부
        else if authorizationStatus == .denied {
            area = "서울특별시 중구"
            // TODO: 팝업으로 권한 확인해야할듯
            // 앱 설정화면으로 이동
            DispatchQueue.main.async {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
        }
        
        // 위치 사용 권한 대기 상태
        else if authorizationStatus == .restricted || authorizationStatus == .notDetermined {
            area = "서울특별시 중구"
            // 권한 요청 팝업창
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
