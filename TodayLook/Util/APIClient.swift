//
//  APIClient.swift
//  TodayLook
//
//  Created by 0ofKim on 2024/02/06.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private var accessToken = ""
    private init() { }
    
    func fetchOAuthToken() {
        guard let url = URL(string: "https://sgisapi.kostat.go.kr/OpenAPI3/auth/authentication.json?consumer_key=\(Bundle.main.SGI_SERVICE_ID)&consumer_secret=\(Bundle.main.SGI_SECRET_KEY)") else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            guard let self else { return }
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            do{
                let apiResponse = try JSONDecoder().decode(OAuthTokenModel.self, from: data)
                self.accessToken = apiResponse.result?.accessToken ?? ""
            } catch(let err){
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
    
    func fetchReverseGeocoding(x: Double, y: Double, completion: @escaping (String) -> ()) {
        guard !accessToken.isEmpty else {
            print("Invalid AccessToken")
            return
        }
        
        let url: String = "https://sgisapi.kostat.go.kr/OpenAPI3/addr/rgeocodewgs84.json?accessToken=\(accessToken)&x_coor=\(x)&y_coor=\(y)&addr_type=20"
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            do{
                let apiResponse = try JSONDecoder().decode(ReverseGeoCodeModel.self, from: data)
                let area = "\(apiResponse.result?.first?.sido_nm ?? "") \(apiResponse.result?.first?.sgg_nm ?? "")"
                completion(area)
                print(apiResponse)
            } catch(let err){
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
}
