//
//  NoListView.swift
//  Todo_App_dcode
//
//  Created by Austin Xu on 2023/7/17.
//

import SwiftUI

struct NoListView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Hello!")
                .font(.title)
                .fontWeight(.bold)
            Text("There's nothing here")
                .font(.title2)
                .fontWeight(.bold)
            Text("What is your main focus today?")
                .font(.title2)
                .fontWeight(.semibold)
            
            
        }
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
