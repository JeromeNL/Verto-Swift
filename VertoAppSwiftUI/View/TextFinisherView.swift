
import SwiftUI

struct TextFinisherView: View {
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
                    
                    Text("Finisher")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(5)
                        .padding(.leading, 10)
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
               
                inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

                Spacer()
                Text(translateOutput).font(.largeTitle).fontWeight(.bold)
                Spacer()
                Spacer()
                optionButtons
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
        viewModel.send(text: "Geef het bijpassende lidwoord voor het " + currentInputLanguage + "e woord " + translateInput + " geef alleen het lidwoord terug") { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
    
}


struct TextFinisherView_Previews: PreviewProvider {
    static var previews: some View {
        TextFinisherView()
    }
}

extension TextFinisherView{
     
    private func inputTextField(isEnabled: Bool, selectedLanguage: String) -> some View{
        VStack(alignment: .leading) {
            Menu {
                Button {
                    isEnabled ? (currentInputLanguage = "English") : (currentOutputLanguage = "English")
                } label: {
                    Text("English 🇬🇧")
                   
                }
                Button {
                    isEnabled ? (currentInputLanguage = "Dutch") : (currentOutputLanguage = "Dutch")
                } label: {
                    Text("Dutch 🇳🇱")
                    
                }
                Button {
                    isEnabled ? (currentInputLanguage = "German") : (currentOutputLanguage = "German")
                } label: {
                    Text("German 🇩🇪")
                    
                }
                Button {
                    isEnabled ? (currentInputLanguage = "French") : (currentOutputLanguage = "French")
                } label: {
                    Text("French 🇫🇷")
                    
                }
            } label: {
                HStack(){
                    Text(selectedLanguage)
                        .font(.title2)
                       .fontWeight(.bold)
                       
                    Image(systemName: "ellipsis.message")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }.foregroundColor(.primary)
                .frame(width: 200, alignment: .leading)
            
            ZStack(alignment: .top) {
                let displayText = isEnabled ? "Type your text" : ""
               
                TextField(displayText, text: (isEnabled ? $translateInput : $translateOutput), axis: .vertical)
                    .disabled(!isEnabled)
                    .padding(5)
                    .padding(.top, 5)
                    .disableAutocorrection(true)
                    
                    
            }
            .frame(width: 350, height: 450, alignment: .top)
            .background()
            .cornerRadius(15)
        .shadow(color: Color.gray, radius: 5.0, x: 0, y: 5)
        }
        .padding(.top, 10)
        
    }
    
    var optionButtons: some View {
        HStack{
            functionButtonItem(widthHeight: 60, icon: "book")
                .padding(.horizontal, 10)
            functionButtonItem(widthHeight: 80, icon: "mic")
            functionButtonItem(widthHeight: 60, icon: "speaker.wave.2")
                .padding(.horizontal, 10)
            
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
    
    private func functionButtonItem(widthHeight: Double, icon: String) -> some View{
        Button(action: {
            
        }, label: {
            ZStack {
                Circle()
                    .fill(.blue)
                .frame(width: widthHeight, height: widthHeight)
                .shadow(radius: 5, x: 0, y: 5)
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (widthHeight / 3), height: (widthHeight / 2.5))
                    .foregroundColor(Color.white)
            }
        })
    }
}
    
  
