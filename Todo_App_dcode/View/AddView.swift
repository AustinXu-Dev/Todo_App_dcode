//
//  AddView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/18.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listviewmodel: ListViewModel

    
    @State var date = Date()
    @State var textFieldText: String = ""
    @State var descFieldText: String = ""
    @State var showingAlert: Bool = false
    
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
//                .datePickerStyle(.graphical)
                .datePickerStyle(CompactDatePickerStyle())
                
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
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Task Saved"), primaryButton: .default(
                        Text("Go To Home")
                    ),
                    secondaryButton: .destructive(
                        Text("Ok")
                    ))
                
            }.background(.white)
                .padding(0)
                .navigationTitle("New Task")
        }
    }
    
    func saveButtonTapped(){
        showingAlert = true
        listviewmodel.addItem(title: textFieldText, desc: descFieldText, date: self.date)
        //        listviewmodel.addItem(title: textFieldText, desc: descFieldText, date: self.date)
    }

    
    
    
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(ListViewModel())
    }
}
