//
//  ItemModel.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    let id: String
    let title: String
    var desc: String = ""
    let isCompleted: Bool
    var dueDate = Date()
    
    init(Id: String = UUID().uuidString, Title: String, Description: String, IsCompleted: Bool, Date: Date) {
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
        self.desc = Description
        self.dueDate = Date
        
    }
    
    func updateCompleted() -> ItemModel{
        return ItemModel(Id: id, Title: title, Description: desc, IsCompleted: !isCompleted, Date: dueDate)
    }
}
