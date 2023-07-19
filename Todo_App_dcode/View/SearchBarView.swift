//
//  SearchBarView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack{
            Text("Hello")
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
