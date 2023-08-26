//
//  ContentView.swift
//  CryptoListApp
//
//  Created by Irfandi Kurniawan Anwar on 11/08/23.
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkApi = NetworkingAPI()
    @State private var showSplash = true
    
    var body: some View {
        
        ZStack{
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
            } else {
                NavigationView {
                    List(networkApi.posts) { post in
                        NavigationLink(destination: DetailView(nama: post.symbol,  data: (post.sparkline_in_7d?.price)!, high24: post.high_24h, low24: post.low_24h, hargaTertinggiSepanjangMasa: post.ath),  label: {
                            HStack {
                                
                                Text("\(post.market_cap_rank). ")
                                    .bold()
                                
                                
                                AsyncImage(url: URL(string: post.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    Image("Load..")
                                        .resizable()
                                        .foregroundColor(Color.gray)
                                }
                                .frame(width: 40, height: 40)
                                
                                Text(post.name)
                                
                                
                                if (post.price_change_percentage_24h > 0){
                                    Text(String("Rp \(Int(post.current_price))"))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .bold()
                                        .foregroundColor(.green)
                                } else {
                                    Text(String("Rp \(Int(post.current_price))"))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .bold()
                                        .foregroundColor(.red)
                                }
                            }
                        })
                    }
                    .padding(.top, 70)
                    .edgesIgnoringSafeArea(.top)
                    .navigationTitle("Crypto List")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        } .onAppear{
            self.networkApi.fetchData()
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 3)
            {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    
