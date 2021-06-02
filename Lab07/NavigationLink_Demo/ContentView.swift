//
//  ContentView.swift
//  NavigationLink_Demo
//
//  Created by Lab1422 on 2021/5/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
        
            VStack {

                Image("Spongebob")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                NavigationLink(
                    destination: DistributeView(),
                    label: {
                        Text("Introduction")
                    })
                
                NavigationLink(
                    destination:OriginView(),
                    label: {
                        Text("Character")
                    })
                
                
                
                
             }
            .navigationTitle("Spongebob")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
