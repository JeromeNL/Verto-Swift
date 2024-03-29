import SwiftUI

struct TranslateView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = ""
    @State var currentOutputLanguage: String = "German"
    @ObservedObject var viewModel = ChatGptViewModel()
    @State private var showWelcomeView = false
    @State private var showMoreOptions = false
    @State private var showSettingsSheet = false
    @State private var sheetHeight:CGFloat = 250
    @State private var showEasterEgg = false
    
  
    var animation: Animation {
        Animation.linear
    }

    var body: some View {
        ScrollView {
            ZStack {
                Color("DefaultBackground")
                VStack{
                    HStack() {
                        TitleEasterEggView(displayTitle: "Translate")
                        Spacer()
                        SettingsView()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                   
                    TextLanguageView(translateInput1: $translateInput, translateOutput1: $translateOutput, currentInputLanguage1: $currentInputLanguage, currentOutputLanguage1: $currentOutputLanguage).inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                        .onSubmit {
                            send()
                        }

                    TextLanguageView(translateInput1: $translateInput, translateOutput1: $translateOutput, currentInputLanguage1: $currentInputLanguage, currentOutputLanguage1: $currentOutputLanguage).inputTextField(isEnabled: false, selectedLanguage: currentOutputLanguage)
                                  
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
        viewModel.send(text: "Translate "+translateInput+" from "+currentInputLanguage+" to "+currentOutputLanguage) { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
}


struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
  
