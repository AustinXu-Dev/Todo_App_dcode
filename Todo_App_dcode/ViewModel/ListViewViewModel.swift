//
//  ListViewViewModel.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/18.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let item_key: String = "item_key"
    
    init(){
        getItems()
    }
    
    func addItem(title: String, desc: String, date: Date){
        let new_item = ItemModel(Title: title, Description: desc, IsCompleted: false, Date: date)
        items.append(new_item)
    }
    
    func move(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func update(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
//    func edit(indexSet: IndexSet){
//        items[indexSet] = ItemModel(Title: <#T##String#>, Description: <#T##String#>, IsCompleted: <#T##Bool#>, Date: <#T##Date#>)
//    }
    
    func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: item_key) else{
            return
        }
        guard let save_items = try? JSONDecoder().decode([ItemModel].self, from: data) else{
            return
        }
        self.items = save_items
        
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: item_key)
        }
    }
    
    
}
