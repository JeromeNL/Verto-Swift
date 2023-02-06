//
//  TextLanguageView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct TextLanguageView {
    
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    
    
    
    public func inputTextField(isEnabled: Bool, selectedLanguage: String) -> some View {
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
                HStack {
                    Text(selectedLanguage).font(.title2).fontWeight(.bold)
                    Image(systemName: "ellipsis.message")
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.foregroundColor(.primary).frame(width: 200, alignment: .leading)
            ZStack(alignment: .top) {
                let displayText = isEnabled ? "Type your text" : ""
                TextField(
                    displayText, text: (isEnabled ? $translateInput : $translateOutput), axis: .vertical
                ).disabled(!isEnabled).padding(5).padding(.top, 5).disableAutocorrection(true)
            }.frame(width: 350, height: 175, alignment: .top).background().cornerRadius(15).shadow(
                color: Color.gray, radius: 5.0, x: 0, y: 5)
        }.padding(.top, 10)
    }
    

}
