//
//  EditView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/19.
//

import SwiftUI

struct EditView: View {

    let item: ItemModel
    @State var textFieldText: String = ""
    @State var descFieldText: String = ""
    @State var date = Date()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listviewmodel: ListViewModel

    var body: some View {
        NavigationView{
            
            List{
                TextField("Type title here...", text: $textFieldText)
                
                    .foregroundColor(Color("darkblue"))
                    .padding(.horizontal)
                    .frame(height: 20)
                    .background(.white)
                    .cornerRadius(10)
                
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
                
                TextField("Type your description here...", text: $descFieldText, axis: .vertical)
                    .foregroundColor(Color("darkblue"))
                    .padding(.horizontal)
                    .lineLimit(3, reservesSpace: true)
                    .background(.white)
                    .cornerRadius(10)
                    .multilineTextAlignment(.leading)
                
                Button(action: saveButtonTapped){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                        Text("Add Task")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
            .background(.white)
            .padding(0)
            .navigationTitle("New Task")
        }
    }
    func saveButtonTapped(){
//        listviewmodel.delete(indexSet: )
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "abcd", Description: "abcd", IsCompleted: false, Date: Date())
    static var previews: some View {
        
        EditView(item: item1)
        .environmentObject(ListViewModel())
    }
}
