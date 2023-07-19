//
//  ListRowView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack(){
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("blue"))
                .frame(height: 90)
                .overlay(
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                         
                            Text(item.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text(item.desc)
                                .font(.body)
                                .foregroundColor(.white)
                        }
                      
                        Spacer()
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 35))
                            .foregroundColor(item.isCompleted ? .green : .red)
                    }.padding(30)
                )
        }.padding(10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "Homework", Description: "Math exercise", IsCompleted: true)
    
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
        }
    }
}
