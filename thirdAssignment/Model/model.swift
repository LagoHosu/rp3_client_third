//
//  model.swift
//  thirdAssignment
//
//  Created by Lago on 2021/07/25.
//

import Foundation
import UIKit

class Memo {
    var title:String
    var content:String
    var date:Date
    var mood:String
    
    //constructor, Memo class에 대해서 content를 기입할 창을 알아서 만들어주는듯? 그럼 Date는 왜 따로쓰는거지
    init(title: String, content: String, date: Date ,mood: String) {
        self.title = title
        self.content = content
        self.date = Date()
        self.mood = mood
    }
    
}


