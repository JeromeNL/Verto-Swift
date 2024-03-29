import SwiftUI

struct ArticleView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    @ObservedObject var viewModel = ChatGptViewModel()
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("DefaultBackground")
                VStack{
                    HStack() {
                        TitleEasterEggView(displayTitle: "Article")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    TextLanguageView(translateInput1: $translateInput, translateOutput1: $translateOutput, currentInputLanguage1: $currentInputLanguage, currentOutputLanguage1: $currentOutputLanguage).inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                        .onSubmit {
                            send()
                        }
                    
                    Spacer()
                    Text(translateOutput).font(.largeTitle).fontWeight(.bold)
                    Spacer()
                    Spacer()
                            }
            }
            .onAppear {
                viewModel.setup()
            }
        .padding()
        }
    }
    
    func send() {
        guard !translateInput.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        viewModel.send(text: "Geef het bijpassende lidwoord voor het " + currentInputLanguage + "e woord " + translateInput + " geef alleen het lidwoord terug") { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}


    
  
