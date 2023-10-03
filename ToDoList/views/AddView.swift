//
//  AddView.swift
//  ToDoList
//
//  Created by A.f. Adib on 10/1/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModels
    @State var textFieldText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type here...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.top, 30)
                    .padding(.horizontal)
                
                Button(action: saveButton , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height : 55)
                        .frame(maxWidth : .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                })
                    
                    
            }
        }
        .navigationTitle("Add an item 🖊")
//        .alert(isPresented: $showAlert, content: {
//            getAlert()
//        })
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("\(alertTitle)"), message: Text("Enter three characters to add item"), dismissButton: .destructive(Text("OK")) )
        }
        
    }
    
    func saveButton () {
        if textAppro(){
            listViewModel.addItem( title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textAppro() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Item must be atleast 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
//    func getAlert () -> Alert {
//        withAnimation {
//            return Alert(title: Text(alertTitle))
//        }
//
//    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModels())
.previewInterfaceOrientation(.portrait)
    }
}
