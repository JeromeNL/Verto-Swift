
import SwiftUI

struct TextFinisherView: View {
    @State var translateInput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    @State var displayText = "Type your text"
    @State var translateResult = ""
    @ObservedObject var viewModel = ChatGptViewModel()
    
    
    var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    TitleEasterEggView().body
                    Spacer()
                    OptionsView().body
                    SettingsView().body
                    
              
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
                TextLanguageView().inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

               Spacer()
                OptionButtonView().body
                    .padding(.bottom, 35)
            }
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
    }
    
    func send() {
        guard !translateInput.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        viewModel.send(text: "Finish the following " + currentInputLanguage + " text: " + translateInput + ".") { response in
            DispatchQueue.main.async {
                translateInput += response
            }
        }
    }
}


struct TextFinisherView_Previews: PreviewProvider {
    static var previews: some View {
        TextFinisherView()
    }
}


  
