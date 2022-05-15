//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by 권유진 on 2022/05/15.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                        } catch {
                            print(error)
                        }                        
                    }
                }
            }
            task.resume()
        }
    }
}