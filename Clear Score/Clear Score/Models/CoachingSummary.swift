//
//  CoachingSummary.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import Foundation

struct CoachingSummary: Codable {
    let activeTodo: Bool?
    let activeChat: Bool?
    let numberOfTodoItems: Int?
    let numberOfCompletedTodoItems: Int?
    let selected: Bool?
}
