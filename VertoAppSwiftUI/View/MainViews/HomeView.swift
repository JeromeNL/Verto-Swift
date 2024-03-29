import SwiftUI

struct HomeView: View {
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
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    var animation: Animation {
        Animation.linear
    }

    var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    TitleEasterEggView(displayTitle: "Speech")
                    Spacer()
                    SettingsView()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
               
                Spacer()
                
                Text("\(swiftUISpeech.outputText)")// prints results to screen
                    .font(.title)
                    .bold().onTapGesture {
                        translateInput = "\(swiftUISpeech.outputText)"
                    }

                swiftUISpeech.getButton()
                    .background(Color.primary)
                    
                Spacer()
            } 
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
    }
    
    func setTranslation(){
        translateInput = swiftUISpeech.outputText
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
  
