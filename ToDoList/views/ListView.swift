//
//  ListView.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModels
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemView()
            }
            else {
                List{
                    ForEach(listViewModel.items) { item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
            }
        }
        
        .navigationTitle("Todo list 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink("Add", destination: AddView())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ListViewModels())
    }
}

