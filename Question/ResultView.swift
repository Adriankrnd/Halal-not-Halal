//
//  ResultView.swift
//  HalalNotHalal
//
//  Created by Millennian Ibnu Adriansyah Karinda on 13/04/23.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var modelData: ModelData
//    @State private var redirectIsActive = false
    
    public var onTapPlayAgain: () -> Void

    func getOpacity(foodResultId: Int) -> CGFloat {
        var result = modelData.questionResult.first {
            $0.foodQuestionId == foodResultId
        }
        
        let answer = result?.isCorrect
        if answer == true {
            return 1
        } else {
            return 0.2
        }
    }
    
    var body: some View {
//        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    if modelData.testScore == 14 {
                        Text("Excellent!")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.top, 120)
                    } else if modelData.testScore <= 13 && modelData.testScore >= 7 {
                        Text("Great Job!")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.top, 120)
                    } else {
                        Text("You can do better!")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.top, 120)
                    }
                    
                    HStack {
                        Text("\(modelData.testScore)")
                            .font(.system(size: 120))
                            .bold()
                        //                        .padding(.trailing,1)
                        Text("/  14")
                            .bold()
                            .font(.system(size: 30))
                            .padding(.top, 60)
                        //                        .padding(.leading,1)
                    }
                    .padding(.bottom, 16)
                    
                    VStack {
                        if modelData.testScore == 14 {
                            Text("“Let’s share this knowledge to our friends to be\nmore mindful towards our Muslim friends.”")
                                .italic()
                                .font(.system(size: 22))
                                .foregroundColor(Color("IslamicGreen"))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 24)
                        } else if modelData.testScore <= 13 &&
                                    modelData.testScore >= 7 {
                            Text("“Now you know the difference between halal\nand haram foods and drinks.”")
                                .italic()
                                .font(.system(size: 22))
                                .foregroundColor(Color("IslamicGreen"))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 24)
                        } else {
                            Text("“Let’s learn to be more mindful\ntowards our moslem friends.”")
                                .italic()
                                .font(.system(size: 22))
                                .foregroundColor(Color("IslamicGreen"))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 24)
                        }
                    }
                    
                    
                    HStack {
                        ForEach(modelData.halalFoodQuestions) { food in
                            Image(food.image)
                                .resizable()
                                .frame(width: 88, height: 80)
                                .opacity(getOpacity(foodResultId: food.id))
                                .padding(.horizontal)
                        }
                        //                        Image(modelData.halalFoodQuestions[4].image)
                        //                            .resizable()
                        //                            .frame(width: 96, height: 75)
                        //                            .padding(.leading,8)
                        //                        //                        .padding(.trailing,36)
                        //                        Image(modelData.halalFoodQuestions[6].image)
                        //                            .resizable()
                        //                            .frame(width: 76, height: 63)
                        //                            .padding(.leading, 8)
                        //                        Image(modelData.halalFoodQuestions[5].image)
                        //                            .resizable()
                        //                            .frame(width: 72, height: 72)
                        //                            .padding(.leading, 16)
                        //                            .padding(.trailing, 24)
                        //                        Image(modelData.halalFoodQuestions[3].image)
                        //                            .resizable()
                        //                            .frame(width: 26, height: 72)
                        //                            .padding(.leading, 8)
                        //                            .padding(.trailing, 24)
                        //                        Image(modelData.halalFoodQuestions[1].image)
                        //                            .resizable()
                        //                            .frame(width: 32, height: 72)
                        //                            .padding(.leading, 4)
                        //                            .padding(.trailing, 12)
                        //                        Image(modelData.halalFoodQuestions[2].image)
                        //                            .resizable()
                        //                            .frame(width: 34, height: 72)
                        //                            .padding(.leading,12)
                        //                            .padding(.trailing, 8)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color("CarpetGreen"), lineWidth: 2)
                    )
                    .padding(.bottom, 16)
                    
                    HStack {
                        ForEach(modelData.haramFoodQuestions) { food in
                            Image(food.image)
                                .resizable()
                                .frame(width: 88, height: 80)
                                .padding(.horizontal)
                                .opacity(getOpacity(foodResultId: food.id))
                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color("HaramRed"), lineWidth: 2)
                    )
                    .padding(.bottom, 40)
                    
                    Button(action: {
                        //                        redirectIsActive = true
                        onTapPlayAgain()
                    }, label: {
                        Text("Play Again")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("IslamicGreen"))
                            .font(.system(size: 22))
                    })
                    .frame(maxWidth: 242, maxHeight: 68)
                    .background(Color("MilkyGreen"))
                    .cornerRadius(12)
                }
                        //                        Image(modelData.haramFoodQuestions[2].image)
                        //                            .resizable()
                        //                            .frame(width: 66, height: 79)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[5].image)
                        //                            .resizable()
                        //                            .frame(width: 81, height: 79)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[4].image)
                        //                            .resizable()
                        //                            .frame(width: 52, height: 72)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[0].image)
                        //                            .resizable()
                        //                            .frame(width: 63, height: 71)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[3].image)
                        //                            .resizable()
                        //                            .frame(width: 35, height: 73)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[6].image)
                        //                            .resizable()
                        //                            .frame(width: 19, height: 72)
                        //                            .padding(.horizontal)
                        //                        Image(modelData.haramFoodQuestions[1].image)
                        //                            .resizable()
                        //                            .frame(width: 22, height: 72)
                        //                            .padding(.horizontal)
                        //                    }
                    
//                    NavigationLink(destination: ContentView(), isActive: $redirectIsActive) {
//                        EmptyView()
                    }
                }
            }
//            .navigationBarHidden(true) // hide the navigation bar
//    }
    
    struct ResultView_Previews: PreviewProvider {
        static private var modelData = ModelData()
        
        static var previews: some View {
            ResultView(onTapPlayAgain: {})
                .previewInterfaceOrientation(.landscapeLeft)
                .environmentObject(modelData)
        }
    }
