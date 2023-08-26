//
//  SplashScreenView.swift
//  CryptoListApp
//
//  Created by Irfandi Kurniawan Anwar on 26/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            Text("Crypto List")
                .font(.title)
                .foregroundColor(.white)
                .bold()
                .padding(.bottom, 50)
            Text("by Fmzr")
                .foregroundColor(.white)
                
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
