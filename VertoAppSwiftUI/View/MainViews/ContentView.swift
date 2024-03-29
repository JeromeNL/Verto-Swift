import OpenAISwift
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ChatGptViewModel()
    @State var text = ""
    @State var models = [String]()
    let sendButtonText:LocalizedStringKey = "SendButtonText"
    let typeHereText:LocalizedStringKey = "TypeHereText"
    
    var body: some View {
        ScrollView {
            VStack{
                VStack(alignment: .leading) {
                    Text("ChatGPT")
                        .font(.title)
                        .fontWeight(.bold)
                    Divider()
                    ForEach(models, id: \.self) { string in
                        Text(string)
                    }
                    Spacer()
                }
                .padding(.bottom, 550)
            }
            .padding(.leading, 20)
        }
                
                VStack {
                    Divider()
                    HStack {
                        TextField(typeHereText, text: $text)
                            .disableAutocorrection(true)
                        Button(sendButtonText) {
                            send()
                        }
                    }
                }
        .padding()
            .onAppear {
                viewModel.setup()
            }
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        models.append("Me: \(text)")
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.models.append("ChatGPT: "+response)
                self.text = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
