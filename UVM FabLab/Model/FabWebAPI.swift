//
//  FabWebAPI.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/13/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation

class FabWebAPI {
    
    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    
    func getTickets(searchTerm: String) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "http://10.245.78.28:5000/tickets?filter=test") {
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(data)
                }
            }
            dataTask?.resume()
        }
    }

}
