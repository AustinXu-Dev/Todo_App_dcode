//
//  ListView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel: ListViewModel
    @State var isPresented = false
    
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
                                .lineLimit(1)
                        }
                        Spacer()
                        Image(systemName: item.isCompleted ? "checkmark.circle" : "xmark.circle")
                            .foregroundColor(item.isCompleted ? .green : .red)
                            .font(.system(size: 30))
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    listviewmodel
                                        .update(item: item)
                                }
                            }
                    }.swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button(action: {listviewmodel.update(item: item)}) {
                            Label("Done", systemImage: "checkmark.circle")
                        }
                    }.tint(.green)
                    
                }.onDelete(perform: listviewmodel.delete) // Delete Function of each stack
                    .onMove(perform: listviewmodel.move) // Move Fun
                    
                    
            }.listStyle(.sidebar)
                .navigationTitle("To Do List")
                .navigationBarItems(leading: EditButton())
                
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(ListViewModel())
    }
}
