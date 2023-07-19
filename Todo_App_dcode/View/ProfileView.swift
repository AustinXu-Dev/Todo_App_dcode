//
//  ProfileView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/18.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Image("background").resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                VStack(alignment: .center, spacing: 40){
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 150, alignment: .top)
                        .clipShape(Circle())
                        .shadow(color: .pink, radius: 5, x:5, y:5)
                    Text("Austin Xu")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .font(.system(.largeTitle))
                        .foregroundColor(.white)
                        .shadow(radius: 5, x:5, y:5)
                    Text("iOS Deveoloper")
                        .foregroundColor(.white)
                        .font(.body)
                    HStack(spacing: 40){
                        Image(systemName: "heart.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "network")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "message.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image(systemName: "phone.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50, alignment: .center)
                    .shadow(color: .pink, radius: 5, y: 8)
                }
                Spacer()
                VStack(alignment: .center, spacing: 40){
                    RoundedRectangle(cornerRadius: 120)
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .shadow(color: .pink, radius: 5, y:8)
                        .overlay(
                            Text("Follow")
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .font(.system(size: 35))
                        )
                    HStack(alignment: .center, spacing: 25){
                        VStack(alignment: .center, spacing: 5){
                            Text("300")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Appreciations")
                                .foregroundColor(.gray)
                        }
                        VStack(alignment: .center, spacing: 5){
                            Text("10")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Followers")
                                .foregroundColor(.gray)
                        }
                        VStack(alignment: .center, spacing: 5){
                            Text("3")
                                .font(.title)
                                .foregroundColor(.pink)
                            Text("Contributions")
                                .foregroundColor(.gray)
                        }
                    }
                    VStack(alignment: .center, spacing: 10){
                        Text("About me")
                            .font(.system(.title))

                        Text("I'm a student who studies in Assumption University as Computer Science major.")
                            .font(.system(.body))
                            .multilineTextAlignment(.center)
                            .lineLimit(4)
                            .opacity(0.7)
                            .foregroundColor(.black)
                    }
                    
                    
                }.padding(25)
            }
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
