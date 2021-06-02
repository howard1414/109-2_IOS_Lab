//
//  OriginView.swift
//  NavigationLink_Demo
//
//  Created by Lab1422 on 2021/5/4.
//

import SwiftUI

struct OriginView: View {
    var body: some View {
        
        let title = ["Characters","TEST"]
        let lyrics = ["The series revolves around the title character and an ensemble cast of his aquatic friends. SpongeBob SquarePants is an energetic and optimistic sea sponge who lives in a submerged pineapple. SpongeBob has a childlike enthusiasm for life, which carries over to his job as a fry cook at a fast food restaurant called the Krusty Krab. One of his life’s greatest goals is to obtain a boat-driving license from Mrs. Puff's Boating School, but he never succeeds. His favorite pastimes include jellyfishing, which involves catching jellyfish with a net in a manner similar to butterfly catching, and blowing soap bubbles into elaborate shapes. He has a pet sea snail named Gary, who meows like a cat."]
        
        
        ForEach(0..<lyrics.count) { index in
            Text(title[index]).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
           Text(lyrics[index])
            Text("\n")
            
        }
    }
}

struct OriginView_Previews: PreviewProvider {
    static var previews: some View {
        OriginView()
    }
}
