//
//  ContentView.swift
//  esteeLauder
//
//  Created by Diya Mishra on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        VStack(spacing: 1) {
            
            Image("hptitle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: 175, height: 75)
            Image("hpimage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
                .cornerRadius(10)
                .padding()
            NavigationLink(destination: page2()) {
                Text("Shop the Look")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color(red: 0.998, green: 0.432, blue: 0.548))
                    .foregroundColor(.white)
                    .cornerRadius(7)
                    .padding()
            }//end of navlink
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.white)
                .frame(width: 175, height: 75)
        }//end of vstack
        .padding()
    }//end of navview
    }//end of body
}//end of struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}//end of struct
