import SwiftUI

struct LanguageImproverView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    @ObservedObject var viewModel = ChatGptViewModel()
    @State private var showWelcomeView = false
    @State private var showMoreOptions = false
    @State private var showSettingsSheet = false
    @State private var sheetHeight:CGFloat = 250
    @State private var showEasterEgg = false
    @State private var TitleClicks = 0
    
    
    var animation: Animation {
        Animation.linear
    }

    var body: some View {
        ScrollView {
            ZStack {
                Color("DefaultBackground")
                VStack{
                    HStack() {
                        TitleEasterEggView(displayTitle: "Improver")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    TextLanguageView(translateInput1: $translateInput, translateOutput1: $translateOutput, currentInputLanguage1: $currentInputLanguage, currentOutputLanguage1: $currentOutputLanguage).inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                        .onSubmit {
                            send()
                        }
                    
                    TextLanguageView(translateInput1: $translateInput, translateOutput1: $translateOutput, currentInputLanguage1: $currentInputLanguage, currentOutputLanguage1: $currentOutputLanguage).inputTextField(isEnabled: false, outputLanguageSelectorDisabled: true, selectedLanguage: currentOutputLanguage)
                                  
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
        viewModel.send(text: "Improve this " + currentInputLanguage + " text: " + translateInput) { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
}


struct LanguageImproverView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageImproverView()
    }
}



    
  
