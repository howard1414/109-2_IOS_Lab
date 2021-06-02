//
//  FileData.swift
//  lab10
//
//  Created by lab1422 on 2021/5/27.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase


struct fileData: Codable, Identifiable {
    @DocumentID var id: String?
    
    let name: String
    let isFinished: Bool
    let deadlineTime: Date
}




