//
//  File.swift
//  
//
//  Created by Millennian Ibnu Adriansyah Karinda on 12/04/23.
//

import Foundation

struct FoodQuestion: Identifiable {
    var id: Int
    var name: String
    var image: String
    var isHalal: Bool = true
    var correctExplanation: String
    var incorrectExplanation: String
    var explanation: String
    var order: Int
}
