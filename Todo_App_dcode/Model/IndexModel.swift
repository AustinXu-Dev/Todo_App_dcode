//
//  IndexModel.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/20.
//

import Foundation

class IndexModel: ObservableObject{
    var selectionIndex: Int = 0
    
    func setSelectionIndex(selectionIndex: Int){
        self.selectionIndex = selectionIndex
    }
}
