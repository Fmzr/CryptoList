//
//  DetailView.swift
//  CryptoListApp
//
//  Created by Irfandi Kurniawan Anwar on 11/08/23.
//

import SwiftUI
import CheesyChart

struct DetailView: View {
    
    let nama: String
    let data: [Double]
    let high24: Double
    let low24: Double
    let hargaTertinggiSepanjangMasa: Double
    
    
    
    
    
    var body: some View {
        ScrollView {
            Text(nama.uppercased())
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading)
                .font(.title)
                .bold()
                .padding(.bottom)
            let setup = SetupChart(data: data.map{$0 * 15000}, currencyIdentifier: "id_ID",
                                   animateChart: true,
                                   startAnimationAfterAppeariance: 0.2,
                                   chartBackground: .cb2,
                                   chartBackgroundColor: Color(UIColor.systemBackground),
                                   showShadow1: true,
                                   showShadow2: true,
                                   chartPriceLabelColor: Color.gray
            )
            
            CheesyChart(setup: setup)
            
            HStack{
                Text("Harga Tertinggi 24H")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                Text("Harga Terendah 24H")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                    .font(.title3)
                    .bold()
                    .padding(.top)
            }
            HStack{
                Text("Rp \(Int(high24))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                    .foregroundColor(.green)
                Text("Rp \(Int(low24))")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                    .font(.title3)
                    .bold()
                    .padding(.top)
                    .foregroundColor(.red)
            }
            VStack{
                Text("Harga Tertinggi Sepanjang Masa")
                    .padding(.top)
                    .font(.title2)
                    .bold()
                Spacer()
                Text("Rp \(Int(hargaTertinggiSepanjangMasa))")
                    .font(.title)
                    .bold()
                    .foregroundColor(.green)
               
            }
            
        } .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(nama: "Coin", data: [0.0, 0.1], high24: 9.0, low24: 3.0, hargaTertinggiSepanjangMasa: 245.0)
    }
}
