//
//  ContentView.swift
//  lab09
//
//  Created by lab1422 on 2021/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var game = Game()
    @State var isStart: Bool = false
    
    var body: some View {
        
        VStack(){
            
            Text("Paper Siscor Stone Game")
                .font(.title)
            
            Spacer()
            
            HStack() {

                Text("Player: ").font(.title2)
                Image(game.playerType!)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(game.playerType!).font(.title2)
            }
            
            HStack() {

                Text("CPU: ").font(.title2)
                Image(game.botType!)
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(game.botType!).font(.title2)
            }
            
            ZStack() {
                
                Image("paperscissorstone")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Button(action: {
                    isStart = true
                    makeGame(game: game)
                    
                }) {
                    Text("Go").font(.title2)
                }

            }
            
            (Text("Result:   ") + (isStart ?
                                    Text(game.gameResult):Text("Press Go")).foregroundColor(.pink))
                .font(.title2)
            
            
            Spacer()
        }
        
   
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
    }
}
