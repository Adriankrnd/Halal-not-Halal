//
//  SwiftUIView.swift
//  
//
//  Created by Millennian Ibnu Adriansyah Karinda on 12/04/23.
//

import SwiftUI

enum FoodLabel {
    case haram
    case halal
}

struct QuestionView: View {
    @EnvironmentObject private var modelData: ModelData
    public var question: FoodQuestion
    public var onTapNext: () -> Void
    
    
    @State private var isAnswered: Bool = false
    @State private var answer: FoodLabel = FoodLabel.halal
//    @State private var resultColor = Color("CarpetGreen")
    
    @State public var currentIndex: Int = 0
    
    
    func chooseHaram() {
        self.answer = FoodLabel.haram
        self.isAnswered = true
        
        let result = QuestionResult(
            foodQuestionId: question.id,
            isCorrect: self.answer == FoodLabel.haram && !question.isHalal
        )
        modelData.questionResult.append(result)
    }
    
    func chooseHalal() {
        self.answer = FoodLabel.halal
        self.isAnswered = true
                
        let result = QuestionResult(
            foodQuestionId: question.id,
            isCorrect: self.answer == FoodLabel.halal && question.isHalal
        )
        modelData.questionResult.append(result)
    }
    
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text(question.name)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color("IslamicGreen"))
                    .padding(.bottom, 24)
                Image(question.image)
                    .padding(.bottom, 36)
                    if isAnswered {
                        VStack{
                            if question.isHalal {
                                if answer == FoodLabel.halal {
                                    Text("You are right, it's Halal!")
                                        .fontWeight(.bold)
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("IslamicGreen"))
                                            //correctAnswers += 1
                                } else {
                                    Text("You were close, it's Halal!")
                                        .fontWeight(.bold)
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("IslamicGreen"))
                                }
                            } else {
                                if answer == FoodLabel.haram {
                                    Text("You are right, it's Haram!")
                                        .fontWeight(.bold)
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("BloodRed"))
                                    //correctAnswers += 1
                                } else {
                                    Text("You were close, it's Haram!")
                                        .fontWeight(.bold)
                                        .font(.system(size: 22))
                                        .foregroundColor(Color("BloodRed"))
                                    //wrongAnswers += 1
                                }
                            }
                            
                            // TO DO
                            // gimana caranya biar explanation sesuai sama pertanyaannya
                            Text(modelData.questions[question.id - 1].explanation)
                                .multilineTextAlignment(.center)
                                .frame(width: 475, height: 80)
                                .foregroundColor(question.isHalal ? Color("IslamicGreen") : Color("BloodRed"))
                                .font(.system(size: 22))
                                .padding(.bottom)
                        }
//                        .frame(maxHeight: 68)
                        .frame(height: 160)
                        // TO DO
                        // gimana caranya biar warnanya sesuai yg haram "haramred" yang halal "carpetgreen"
                        .padding(.all, 24)
                        .padding(.bottom, 4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(question.isHalal ? Color("CarpetGreen") : Color("HaramRed"),
                                        lineWidth: 2)
                        )
                        .padding(.bottom, 36)
                    } else {
                        HStack{
                            Button(action: chooseHalal) {
                                Text("Halal")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color("IslamicGreen"))
                                    .font(.system(size: 22))
                            }
                            .frame(maxWidth: 242
                                   , maxHeight: 68
                            )
                            .background(Color("CarpetGreen"))
                            .cornerRadius(12)
                            .padding(.trailing, 75)
                            Button(action: chooseHaram) {
                                Text("Haram")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color("BloodRed"))
                                    .font(.system(size: 22))
                            }
                            .frame(maxWidth: 242
                                   , maxHeight: 68
                            )
                            .background(Color("HaramRed"))
                            .cornerRadius(12)
                        }
                        .frame(height: 160)
                        .padding(.all, 24)
                        .padding(.bottom, 4)
                        .padding(.bottom, 36)
                        
//                        Rectangle()
//                            .fill(.clear)
//                            .frame(height: 160)
//                            .padding(.all, 24)
//                            .padding(.bottom, 4)
//                            .padding(.bottom, 36)
                    }
                
                HStack {
                    if isAnswered {
                        Button {
                            self.isAnswered = false
                            
                            onTapNext()
                        } label: {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("IslamicGreen"))
                                .font(.system(size: 22))
                        }
                        .frame(maxWidth: 242, maxHeight: 68)
                        .background(Color("MilkyGreen"))
                        .cornerRadius(12)
                    } else {
                        Rectangle()
                            .fill(.clear)
                            .frame(maxWidth: 242, maxHeight: 68)
//                        Button(action: chooseHalal) {
//                            Text("Halal")
//                                .frame(maxWidth: .infinity)
//                                .foregroundColor(Color("IslamicGreen"))
//                                .font(.system(size: 22))
//                        }
//                        .frame(maxWidth: 242, maxHeight: 68)
//                        .background(Color("CarpetGreen"))
//                        .cornerRadius(12)
////                        .padding(.trailing, 75)
//                        Button(action: chooseHaram) {
//                            Text("Haram")
//                                .frame(maxWidth: .infinity)
//                                .foregroundColor(Color("BloodRed"))
//                                .font(.system(size: 22))
//                        }
//                        .frame(maxWidth: 242, maxHeight: 68)
//                        .background(Color("HaramRed"))
//                        .cornerRadius(12)
                    }
                }
 
                
                Spacer()
//                if modelData.questions[question.id - 1] {
                    HStack(spacing: 0) {
                        ForEach(0 ..< 14) {index in
                          Rectangle()
                                .foregroundColor(index < question.id ? Color("CarpetGreen")
                                                              : Color.secondary.opacity(0.3))
                                //index = rectangle
                                //jadi kalau si rectangle < question.id baru keisi
                        }
                      }
                      .frame(maxHeight: 20)
                      .padding(.bottom, 0)
//                }
                
                }
            .padding(.top, 80)
            }
        
//        QuestionView.current.liveView = UIHostingController(
//          rootView: SegmentedProgressView(value: 2)
//        )
//            .padding(.top, 160)
//            .padding(.bottom, 62)
            
        }
    }

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: ModelData().questions[0], onTapNext: {})
    }
}
