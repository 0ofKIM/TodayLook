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
}
