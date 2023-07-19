//
//  ListView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel: ListViewModel
    
    var body: some View {
        
        NavigationView{
            List{
                // Item View For each
                ForEach(listviewmodel.items){ item in
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text(item.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(item.desc)
                                .font(.body)
                                .foregroundColor(.black)
                            Text("Due at: \(item.dueDate.formatted(date: .numeric, time: .standard))")
                                .font(.body)
                                .foregroundColor(.gray)
                            
                        }
                        Spacer()
                        Image(systemName: item.isCompleted ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(item.isCompleted ? .green : .red)
                            .font(.system(size: 30))
                    }.onTapGesture {
                        withAnimation(.easeIn){
                            listviewmodel
                                .update(item: item)
                        }
                    }

                }.onDelete(perform: listviewmodel.delete) // Delete Function of each stack
            }.listStyle(.sidebar)
                .navigationTitle("To Do List")
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(ListViewModel())
    }
}
