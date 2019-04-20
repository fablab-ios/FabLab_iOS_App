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
    
    func getTickets(searchTerm: String, callback: @escaping ([Ticket]) -> ()) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "http://www.goatgoose.com:7000/tickets?filter=" + searchTerm) {
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let jsonArray = jsonResponse as? [[Any]] else {
                            return
                        }
                        var tickets: [Ticket] = []
                        for ticketArray in jsonArray {
                            guard let ticketNumber = ticketArray[0] as? Int else { return }
                            guard let date = ticketArray[1] as? String else { return }
                            guard let time = ticketArray[2] as? String else { return }
                            guard let ticketName = ticketArray[3] as? String else { return }
                            guard let studentName = ticketArray[4] as? String else { return }
                            guard let email = ticketArray[5] as? String else { return }
                            guard let status = ticketArray[6] as? String else { return }
                            guard let notes = ticketArray[7] as? String else { return }
                            tickets.append(Ticket(ticketNumber: ticketNumber, date: date, time: time, ticketName: ticketName, studentName: studentName, email: email, status: status, notes: notes))
                        }
                        DispatchQueue.main.async {
                            callback(tickets)
                        }
                    } catch let parsingError {
                        print("parsing error")
                    }
                    
                }
            }
            dataTask?.resume()
        }
    }
    
    func getInfo(callback: @escaping (String) -> ()) {
        if var urlComponents = URLComponents(string: "http://www.goatgoose.com:7000/info") {
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let jsonDict = jsonResponse as? Dictionary<String, String> else {
                            return
                        }
                        
                        guard let info = jsonDict["info"] else { return }
                        
                        DispatchQueue.main.async {
                            callback(info)
                        }
                        
                    } catch let parsingError {
                        print("parsing error")
                    }
                }
            }
            dataTask?.resume()
        }
    }

}
