//
//  NoItemView.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/4/23.
//

import SwiftUI

struct NoItemView: View {
    @State var headline : String = ""
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 50)
                Text("Click here 👇 to add items ")
                    .padding(.top, 5)
                    .font(.headline)
                    
                
                NavigationLink("Add items ✍🏻", destination: AddView())
                    .padding()
                    .font(.largeTitle.bold())
                    .background(.blue.opacity(0.3))
                    .cornerRadius(20)
                    .padding()
                  
                
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemView()
        }
        .preferredColorScheme(.light)
        
    }
}
