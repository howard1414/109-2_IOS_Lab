//
//  GameViewModel.swift
//  lab09
//
//  Created by luo on 2021/5/21.
//

import Foundation


func makeGame(game : Game) {
    
    game.botType = getTypeString(tp: type.allCases.randomElement()!)
    game.playerType = getTypeString(tp: type.allCases.randomElement()!)
    
    if(game.botType == game.playerType) {
        game.gameResult = "tie"
    }
    
    //bot win condition
    else if ( (game.botType == "paper" && game.playerType == "stone") || (game.botType == "stone" && game.playerType == "scissor") || (game.botType == "scissor" && game.playerType == "paper")) {
        game.gameResult = "lose"
    }
    //player win condition
    else{
        game.gameResult = "win"
    }
    
    
    print(game.playerType)
    print(game.botType)
    print(game.gameResult)
}


func getTypeString(tp : type) -> String? {
    switch tp {
    case .paper:
        return "paper"
    case .scissor:
        return "scissor"
    case .stone:
        return "stone"
    }
}

