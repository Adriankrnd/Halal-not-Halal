import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showQuestion = false
    @State private var index: Int = 0
//    @State private var correctAnswers = 0
//    @State private var wrongAnswers = 0
    
//    @State private var currentLevelIndex = 0
//
//    var currentLevel: QuizLevel {
//        levels[1]
//
//    func nextLevel() {
//        if currentLevelIndex < level.count - 1 {
//            currentLevelIndex += 1
//        } else {
//            currentLevelIndex = 0
//            score = 0
//        }
//    }
//
//    func checkAnswer(_ answer: Bool) {
//        if answer == currentLevel.answer {
//            score += 1
//        }
//        nextLevel()
//    }
//    
//    Button("yes") {
//        checkAnswer(true)
//    }
    
    func nextQuestion() {
        if self.index < modelData.questions.count {
            self.index += 1
        } else {
            // TODO: navigate to ResultView
       
        }
    }
    
    func playAgain(){
        self.index = 0
        self.showQuestion = false
        self.modelData.questionResult = []
    }
    
    var body: some View {
        Group{
            if showQuestion {
                if self.index < modelData.questions.count {
                    QuestionView(
                        question: modelData.questions[index],
                        onTapNext: nextQuestion,
                        currentIndex: index
                    )
                } else {
                    ResultView(onTapPlayAgain: playAgain)
                }
            }else {
                ZStack {
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Image("islamic star")
                                .padding(.bottom, 150.0)
                            VStack {
                                Text("Halal")
                                    .fontWeight(.bold)
                                    .font(.system(size: 60))
                                    .foregroundColor(Color("IslamicGreen"))
                                Text("not")
                                    .fontWeight(.bold)
                                    .font(.system(size: 60))
                                    .foregroundColor(Color("IslamicGreen"))
                                Text("Halal")
                                    .fontWeight(.bold)
                                    .font(.system(size: 60))
                                    .foregroundColor(Color("IslamicGreen"))
                            }
                            Image("islamic star")
                                .padding(.top, 150.0)
                        }
                        .padding(.bottom)
                        .padding(.top, 32)
                        Text("“Halal means 'lawful', it pertains to what Muslims")
                            .italic()
                            .font(.system(size: 22))
                            .foregroundColor(Color("IslamicGreen"))
                        Text("can do, especially in regards to food and drink.”")
                            .italic()
                            .font(.system(size: 22))
                            .foregroundColor(Color("IslamicGreen"))
                            .padding(.bottom, 40)
                        
                        Button() {
                            self.showQuestion = true
                        }label: {
                            Text("Play Now")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("IslamicGreen"))
                                .font(.system(size: 22))
                        }
                        .frame(maxWidth: 242, maxHeight: 68)
                        .background(Color("MilkyGreen"))
                        .cornerRadius(12)
                    }
                }
            }
        }
//--------MASUKIN LAGU----------
//        .onAppear{
//            let sound = Bundle.main.path(forResources: "Nama Lagu", offtype: "mp3")
//        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ModelData())
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }

