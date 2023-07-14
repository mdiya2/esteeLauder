//
//  page2.swift
//  esteeLauder
//
//  Created by Diya Mishra on 7/12/23.
//
//ALL FONTS NEED TO BE EDITES TO BRAND FONTS

import SwiftUI

struct page2: View {
    @State private var isPresentingGame = false
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    ZStack{
                        Rectangle()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(Color(red: 0.908, green: 0.627, blue: 0.724))
                        Text("FOAM CLEANSER")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }//end of zstack
                    Image("page21")
                        .resizable()
                        .frame(width: 200, height: 200)
                }//end of hstack
                
                HStack{
                    Image("page22")
                        .resizable()
                        .frame(width: 200, height: 200)
                    ZStack{
                        Rectangle()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(Color(red: 0.998, green: 0.432, blue: 0.548))
                        Text("ESSENCE LOTION")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }//end of zstack
                }//end of hstack
                
                HStack{
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(Color(red: 0.974, green: 0.249, blue: 0.419))
                        Text("SOFT CREME/MASK")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }//end of zstack
                    Image("page24")
                        .resizable()
                        .frame(width: 200, height: 200)
                }//end of hstack
                
                HStack{
                    Image("page23")
                        .resizable()
                        .frame(width: 200, height: 200)
                    ZStack{
                        Rectangle()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(Color(red: 0.952, green: 0.888, blue: 0.906))
                        Text("AIRY LOTION")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    }//end of zstack
                }//end of hstack
                Button(action: {
                    isPresentingGame = true
                }) {
                    Text("What is the best skincare for you?")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.998, green: 0.432, blue: 0.548))
                .sheet(isPresented: $isPresentingGame) {
                    Game()
                }//end of vstack
            }//end of scroll view
            
        }//end of body
    }//end of struct
    
    struct page2_Previews: PreviewProvider {
        static var previews: some View {
            page2()
        }
    }
}
