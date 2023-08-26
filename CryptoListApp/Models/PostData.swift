//
//  PostData.swift
//  CryptoListApp
//
//  Created by Irfandi Kurniawan Anwar on 11/08/23.
//

import Foundation


struct Post: Codable, Identifiable {
    let id : String
    let name: String
    let symbol: String
    let current_price: Double
    let price_change_percentage_24h: Double
    let image: String
    let market_cap_rank: Int
    let sparkline_in_7d: Grafik7Hari?
    let high_24h: Double
    let low_24h: Double
    let ath: Double
    
    
}

struct Grafik7Hari: Codable {
    let price: [Double]?
}

//struct Price: Decodable {
    
  //  struct USD: Decodable {
       // let price: Double
    //}
    
    //enum CodingKeys: CodingKey {
      //  case quotes
    //}
    
    //let quotes: [USD]
//}


