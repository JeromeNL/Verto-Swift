//
//  TextLanguageView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct TextLanguageView {
    
    @Binding var translateInput1: String
    @Binding var translateOutput1: String
    @Binding var currentInputLanguage1: String
    @Binding var currentOutputLanguage1: String
    
    
    public func inputTextField(isEnabled: Bool, selectedLanguage: String) -> some View {
        VStack(alignment: .leading) {
            Menu {
                Button {
                    isEnabled ? (currentInputLanguage1 = "English") : (currentOutputLanguage1 = "English")
                } label: {
                    Text("English 🇬🇧")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "Dutch") : (currentOutputLanguage1 = "Dutch")
                } label: {
                    Text("Dutch 🇳🇱")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "German") : (currentOutputLanguage1 = "German")
                } label: {
                    Text("German 🇩🇪")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "French") : (currentOutputLanguage1 = "French")
                } label: {
                    Text("French 🇫🇷")
                }
            } label: {
                HStack {
                    Text(selectedLanguage).font(.title2).fontWeight(.bold)
                    Image(systemName: "ellipsis.message")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.primary).frame(width: 200, alignment: .leading)
            
            ZStack(alignment: .top) {
                let displayText = isEnabled ? "Type your text" : ""
                TextField(
                    displayText, text: (isEnabled ? $translateInput1 : $translateOutput1), axis: .vertical
                )
                .disabled(!isEnabled)
                .padding(5)
                .padding(.top, 5)
                .disableAutocorrection(true)
            }
            .frame(width: 350, height: 175, alignment: .top)
            .background()
            .cornerRadius(15)
            .shadow(
                color: Color.gray, radius: 5.0, x: 0, y: 5)
        }
        .padding(.top, 10)
    }
    

}
