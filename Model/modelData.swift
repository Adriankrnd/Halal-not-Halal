//
//  File.swift
//  
//
//  Created by Millennian Ibnu Adriansyah Karinda on 12/04/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var questions: [FoodQuestion] = [
        FoodQuestion(
            id: 1,
            name: "Bacon",
            image: "Bacon",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "It is stated in the Quran that foods and drinks that contain pigs are haram. Scientifically, pork also carries more disease than other meats.",
            order: 4
        ),
        FoodQuestion(
            id: 2,
            name: "Beef",
            image: "Beef",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "The butcher needs to be a Muslim and is aware\nof the act of slaughter and needs to slaughter\nlivestocks by cutting through their neck.",
            order: 1
        ),
        FoodQuestion(
            id: 3,
            name: "Blood Sausage",
            image: "Blood",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "Blood contains high uric acid, cholestrol and\nsaturated fat that is unhealthy for the human body\nthus making it haram.",
            order: 7
        ),
        FoodQuestion(
            id: 4,
            name: "Carrot",
            image: "Carrot",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "Vegetables are considered halal such as carrot,\nbroccoli, etc. As long as they are not cooked with\nnon-halal ingredients such as mirin and lard.",
            order: 6
        ),
        FoodQuestion(
            id: 5,
            name: "Cat",
            image: "Cat",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "Fanged, taloned and clawed animals are not\nelligible for consumption to ensure the safety of humans as they are potential dangers (predators).",
            order: 1
        ),
        FoodQuestion(
            id: 6,
            name: "Chicken",
            image: "Chicken",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "The butcher needs to be a Muslim and is aware\nof the act of slaughter and needs to slaughter\nlivestocks by cutting through their neck.",
            order: 7
        ),
        FoodQuestion(
            id: 7,
            name: "Cola",
            image: "Cola",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "All beverages are halal as long as it doesn’t have\nthe chance of making a person drunk. Even on the\nslightest 0.5% or less it’s better to not consume it.",
            order: 5
        ),
        FoodQuestion(
            id: 8,
            name: "Corpse",
            image: "Corpse",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "When an animal dies not in the Islamic way (cutting through the neck), flesh begins to decompose rapidly making it unsafe to eat.",
            order: 5
        ),
        FoodQuestion(
            id: 9,
            name: "Crab",
            image: "Crab",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "All creatures from the sea are considered pure and safe for Muslims to consume. This includes all seafood from fish, mollusc to crustaceans.",
            order: 2
        ),
        FoodQuestion(
            id: 10,
            name: "Frog",
            image: "Frog",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "Animals who live in two environments (land and water) are considered haram. This includes frogs, salamanders, crocodiles, turtles, etc.",
            order: 3
        ),
        FoodQuestion(
            id: 11,
            name: "Rat",
            image: "Rat",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "In addition to being unclean, rats and mice are carriers of several diseases that can cause serious illnesses and even death.",
            order: 2
        ),
        FoodQuestion(
            id: 12,
            name: "Tuna",
            image: "Tuna",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "Fish doesn’t require to be slaughtered and the Quran also permits fish as a source of food. Just be aware of non-halal ingredients when cooking.",
            order: 4
        ),
        FoodQuestion(
            id: 13,
            name: "Watermelon",
            image: "Watermelon",
            correctExplanation: "You are right, it's Halal!",
            incorrectExplanation: "You were close, it's Halal!",
            explanation: "Fruits are considered halal such as watermelon, apple, etc. Fermented fruits and fruit cocktails however contain alcohol which is haram.",
            order: 3
        ),
        FoodQuestion(
            id: 14,
            name: "Wine",
            image: "Wine",
            isHalal: false,
            correctExplanation: "You are right, it's Haram!",
            incorrectExplanation: "You were close, it's Haram!",
            explanation: "Foods and drinks that have a chance to make you drunk are not permissible in Islam. This includes alcoholic drinks, rum on cake and cooking alcohol.",
            order: 6
        )
    ]
    
    @Published var questionResult: [QuestionResult] = []
    
    var testScore: Int {
        questionResult.filter { result in
            result.isCorrect == true
        }.count
    }
    
    var halalFoodQuestions: [FoodQuestion] {
        questions.filter { question in
            question.isHalal == true
        }
        .sorted {
            $0.order < $1.order
        }
    }
    
    var haramFoodQuestions: [FoodQuestion] {
        questions.filter { question in
            question.isHalal == false
        }
        .sorted {
            $0.order < $1.order
        }
    }
}


// TODO
// 1. tau jumlah yang benar jawabannya
// 2. tau jumlah questionnya berapa (ada 14)
// 3. membedakan image yang benar dan salah (nentuin opacity)
// 4. tau konteks food nya itu halal/haram (klasifikasi)
// - dari model FoodQuestion (isHalal)
