//
//  DataService.swift
//  EarthQuakeAPI
//
//  Created by Just Kidding on 4/25/19.
//  Copyright © 2019 Just Kidding. All rights reserved.
//

import Foundation
typealias JSON = [String: Any]
class DataService {
    static var sharedInstance = DataService()
    
    func makeDataTaskRequest(completionHandler: @escaping (EarthQuakeModel) -> Void) {
        let uRL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
        guard let url = URL(string: uRL) else {return}
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, respone, error) in
            guard error == nil else {
                return
            }
            guard let aData = data else {return}
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? JSON {
                    DispatchQueue.main.async {
                        completionHandler(EarthQuakeModel(dict: jsonObject))
//                        print(EarthQuakeModel(dict: jsonObject).features)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
