//
//  ContentView.swift
//  Lab08
//
//  Created by lab1422 on 2021/5/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var isFan : Bool = true
    @State var age: Int = 18
    @State var birthTime = Date()
    @State var likeDegree : CGFloat = 5
    @State var selectedIndex = 0
    @State var said = ""
    
    @State var showAlert = false
    
    var roles = ["MotherBoard", "GraphicCard", "PowerSuply"]
    
    
    var body: some View {
        
        VStack {
            

            

            Text("ROG")
                .font(.title)
            
            Image("ROG")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .blur(radius: 5)

            Spacer()
            Toggle(isOn: $isFan, label: {
                Text("Fan Already？")
            })
            
            Stepper("Age: \(age)", value: $age)
            
            DatePicker("Birth: ", selection: $birthTime, displayedComponents: .date)
            



            Slider(value: $likeDegree, in: 0...10, step: 1, minimumValueLabel: Text("FavoriteLevel"), maximumValueLabel: Text("\(Int(likeDegree))分")){
                Text("age")
             }

            HStack{
                Text("Product: ")
                
                Picker(selection: $selectedIndex, label: Text("Choose")) {
                    ForEach(roles.indices) { (index) in
                       Text(roles[index])
                    }
                }
            }
            
            TextField("Bruh.....", text: $said)
            
            Button(action: {
               showAlert = true
            }) {
               VStack {
                    
                Text("Send")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.purple)
                .padding()
                .border(Color.purple, width:10)

               }
            }.alert(isPresented: $showAlert) { () -> Alert in

                let result  = isFan ? "YES": "NO"
                

                
                let msg = [Text("Agee is\(age).\n And the birth: "), Text(birthTime, style: .date), Text("\n I liked \(Int(likeDegree))point\n"),
                    Text("My product is: \(roles[selectedIndex])\n"),
                Text("I want to say: \(said)")]

                
                
                return Alert(title: Text("\(result)ROG's Fans is me"), message: msg[0] + msg[1] + msg[2] + msg[3] + msg[4])
            }
            
            
            
        }
        .padding(10)
        
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
