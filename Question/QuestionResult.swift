//
//  File.swift
//  
//
//  Created by Millennian Ibnu Adriansyah Karinda on 13/04/23.
//

import Foundation

struct QuestionResult: Identifiable {
    var id: UUID = UUID()
    var foodQuestionId: Int
    var isCorrect: Bool?
}


