//
//  FormalMakerView.swift
//  VertoAppSwiftUI
//
//  Created by Joram Kwetters on 31/01/2023.
//

import SwiftUI

struct FormalMakerView: View {
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
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    TitleEasterEggView(displayTitle: "FormalMaker")
                    Spacer()
                    OptionsView()
                    SettingsView()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
               
                TextLanguageView().inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

                TextLanguageView().inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                              
           
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
        viewModel.send(text: "Make this " + currentInputLanguage + " text more formal: " + translateInput) { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
    
    
}


struct FormalMakerView_Previews: PreviewProvider {
    static var previews: some View {
        FormalMakerView()
    }
}

