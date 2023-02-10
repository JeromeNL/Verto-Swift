
import SwiftUI

struct SynonymsView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    @ObservedObject var viewModel = ChatGptViewModel()
    

    var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    
                    TitleEasterEggView(displayTitle: "Synonyms")
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
                TextLanguageView().inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

                Spacer()
                
                
                let arrayOfStrings = translateOutput.components(separatedBy: ", ")
                List{
                    ForEach(arrayOfStrings, id: \.self) { tag in
                        Text(tag.capitalized)
                                }
                }
                .scrollContentBackground(.hidden)
              
                Spacer()
                Spacer()
                OptionButtonView()
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
        viewModel.send(text: "Give 3 relevant synonyms for the " + currentInputLanguage + " word " + translateInput + ". Give the synonyms comma separated without other information in " + currentInputLanguage) { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
    
}


struct SynonymsView_Previews: PreviewProvider {
    static var previews: some View {
        SynonymsView()
    }
}



    
  
