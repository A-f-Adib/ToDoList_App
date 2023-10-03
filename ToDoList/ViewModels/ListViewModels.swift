//
//  ListViewModels.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import Foundation

class ListViewModels : ObservableObject {
    @Published var items : [itemModel] = [] {
        
        didSet {
            saveItems()
        }
    }
    
    init(){
        getItems()
    }
    
    func getItems (){
//        let newItems = [
//            itemModel(title: "First title", isCompleted: false),
//            itemModel(title: "Second title", isCompleted: true),
//            itemModel(title: "Third", isCompleted: false)]
//        items.append(contentsOf: newItems)
        
       guard let data = UserDefaults.standard.data(forKey: "item_list"),
             let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems
    }
    
    func deleteItem(indexset : IndexSet){
        items.remove(atOffsets: indexset)
    }
    
    func moveItem (from : IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem (title : String) {
        let newItem = itemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem (item : itemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateModel()
        }
    }
    
    func saveItems () {
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: "Item_list")
        }
    }
}
