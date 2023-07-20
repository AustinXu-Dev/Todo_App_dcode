//
//  MainView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listviewmodel: ListViewModel
    
    // Default value for each task
    @State var date = Date()
    @State var textFieldText: String = ""
    @State var descFieldText: String = ""
    @State var showingAlert: Bool = false
    @State var alertTitle: String = ""
    @State var validText: Bool = false
    
    // Controll view by this index
    @State var selectionIndex = 0
    var body: some View {
        TabView(selection: $selectionIndex){
            // View for home
            if listviewmodel.items.isEmpty{
                NoListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
            } else{
                ListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
            }
            // View for Add Tab
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
                }.alert(isPresented: $showingAlert, content: getSaveAlert)
                    .background(.white)
                    .padding(0)
                    .navigationTitle("Add New Task")
            }
            .tabItem{
                Label("Add", systemImage: "plus.circle.fill")
            }.tag(2)
            
            // View for profile
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person")
                }.tag(3)
            
            
        }.environmentObject(ListViewModel())
    }
     
    // clean up after task
    func cleanUpSpace(){
        self.textFieldText = ""
        self.descFieldText = ""
        self.date = Date()
    }
    // Return back to home by selection index
    func goToHome(){
        selectionIndex = 1
    }
    
    
    func saveButtonTapped(){
        if textIsValid(){
            showingAlert = true
            listviewmodel.addItem(title: textFieldText, desc: descFieldText, date: date)
            cleanUpSpace()
        }
        
    }
    
    // Check validatin of text
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Text should contain atleast 3 characters"
            showingAlert.toggle()
            return false
        }
        else if descFieldText.count < 3{
            alertTitle = "Description should contain atleast 3 characters"
            showingAlert.toggle()
            return false
        }
        validText = true
        return true
    }
    
    // Get alert based on condition
    func getSaveAlert() -> Alert{
        if validText{
            return Alert(title: Text("Task Saved"), primaryButton: .destructive(
                Text("Cancel"), action: cleanUpSpace
            ),
                  secondaryButton: .default(
                Text("Ok"), action: goToHome
            ))
        } else{
            return Alert(title: Text(alertTitle))
        }
        
    }
}

//struct SheetPresenter<Content>: View where Content: View {
//    @Binding var presentingSheet: Bool
//    var content: Content
//    var body: some View {
//        ListView()
//            .sheet(isPresented: self.$presentingSheet, content: { self.content })
//            .onAppear {
//                DispatchQueue.main.async {
//                    self.presentingSheet = true
//                }
//            }
//    }
//}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MainView()
        }.environmentObject(ListViewModel())
    }
}
