//
//  RequestAPI.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/28.
//

import Foundation

class RequestAPI: ObservableObject {
    @Published var weather: TestModel = TestModel()
    var serviceKey = "PCcVQZnYviz45O7pc9xX8ahyyUfQgrJw9oG6ZDKO9siAsvyoVkZ5Z1HyD3KR9gRFCJLbzXizG1MiwwBz2FFBCg%3D%3D"

    func getWeather() {
        guard let url = URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?ServiceKey=\(serviceKey)&pageNo=1&numberOfRows=100&dataType=JSON&base_date=20231228&base_time=0600&nx=60&ny=127") else { return }

        let urlRequest = URLRequest(url: url)

        // Task 만들기
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            // 응답 상태코드가 200(성공)일 경우에만 디코딩
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedWeather = try JSONDecoder().decode(TestModel.self, from: data)
                        self.weather = decodedWeather
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        // Task 수행하기
        dataTask.resume()
    }
}
