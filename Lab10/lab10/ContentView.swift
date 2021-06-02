//
//  ContentView.swift
//  lab10
//
//  Created by lab1422 on 2021/5/27.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct ContentView: View {
    
    @State  var DeadLineTime = Date()
    @State  var isFinished: Bool = true
    @State  var name: String = ""

    @State var todoList = [fileData]()
    
    var body: some View {
        
        VStack() {
            
            Text("Todo App")
                .font(.title)
                .padding()
            
            Text("Enter Event:")
            HStack {
                Text("Name: ")
                TextField("Please Enter Text: ", text: $name)
            }
      
            Toggle(isOn: $isFinished) {
                Text("Is Finished?")
            }
            .padding(.trailing, 250.0)

            
            DatePicker("Expiration Time", selection: $DeadLineTime)
                .padding(.trailing, 100.0)
            
            Button(action: createData) {
                Text("Create Data")
            }
            
            Text("                                         ")
            Text("Current Data")
            
            Button(action: fetchData) {
                Text("Load Data")
            }
            
            
            List(todoList) { todo in

              VStack(alignment: .leading) {
                Text("Name: " + todo.name)
                  .font(.headline)
                Text("Is Finished:  "  + (todo.isFinished ? "YES" : "NO"))
                  .font(.subheadline)
                Text("Expiration Time: \(todo.deadlineTime)")
                  .font(.subheadline)
              }
            }
            

        }
       
    }
   
}




extension ContentView {

    func createData() {
            let db = Firestore.firestore()
            
        let data = fileData(name: name, isFinished: isFinished, deadlineTime: DeadLineTime)
            do {
                let documentReference = try db.collection("Todo").addDocument(from: data)
                print(documentReference.documentID)
            } catch {
                print(error)
            }
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("Todo").getDocuments { snapshot, error in
                
             guard let snapshot = snapshot else { return }
            
             let todo = snapshot.documents.compactMap { snapshot in
                 try? snapshot.data(as: fileData.self)
             }
            self.todoList = todo
                
         }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
