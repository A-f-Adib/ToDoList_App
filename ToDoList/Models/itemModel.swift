//
//  itemModel.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import Foundation

struct itemModel : Identifiable, Codable
{
    let id: String
    let title : String
    let isCompleted : Bool
    
    init (id : String = UUID().uuidString, title : String, isCompleted : Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateModel () -> itemModel {
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
