import OpenAISwift
import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel = ChatGptViewModel()
    @State var text = ""
    @State var models = [String]()
    

    var body: some View {
        VStack(alignment: .leading) {
           
            Text("ChatGPT")
                .font(.title)
                .fontWeight(.bold)
            Divider()
            ForEach(models, id: \.self) { string in
                Text(string)
            }

            Spacer()

            VStack {
                Divider()
                HStack {
                    TextField("Type here ", text: $text)
                        .disableAutocorrection(true)
                    Button("Send") {
                        send()
                    }
                }
            }
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
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