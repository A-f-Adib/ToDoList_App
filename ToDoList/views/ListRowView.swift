//
//  ListRowView.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item : itemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle.fill" : "checkmark.circle.fill")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "first", isCompleted: false)
    static var item2 = itemModel(title: "second", isCompleted: true)
    
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
         
    }
}
