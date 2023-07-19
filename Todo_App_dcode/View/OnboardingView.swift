//
//  OnboardingView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/16.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 40){
                HStack{
                    Text("Make Your \nWork Done")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                }.padding(.horizontal, 10)
                    .frame(width: 300, alignment: .leading)
                    
                Image("screen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                NavigationLink(destination: MainView()) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 50)
                        .foregroundColor(Color("lightblue"))
                        .overlay(
                            HStack{
                                Text("Next")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Image(systemName: "chevron.right")
                                
                            }
                        )
                        .padding(10)
                }
                
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
