//
//  NetworkingAPI.swift
//  CryptoListApp
//
//  Created by Irfandi Kurniawan Anwar on 11/08/23.
//

import Foundation

class NetworkingAPI: ObservableObject {
    
    @Published var posts: [Post] = []
    
    func fetchData(){
        
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=id&precision=0") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respons, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            
                            let results = try decoder.decode([Post].self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results
                            }
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
