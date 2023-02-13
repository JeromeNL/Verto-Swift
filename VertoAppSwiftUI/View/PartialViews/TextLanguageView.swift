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
    let typeHereText:LocalizedStringKey = "TypeHereText"
    let improved:LocalizedStringKey = "Improved";
    let english:LocalizedStringKey = "English";
    let dutch:LocalizedStringKey = "Dutch";
    let german:LocalizedStringKey = "German";
    let french:LocalizedStringKey = "French";
    
    
    public func inputTextField(isEnabled: Bool, outputLanguageSelectorDisabled: Bool = false, selectedLanguage: String) -> some View {
        VStack(alignment: .leading) {
            Menu {
                Button {
                    isEnabled ? (currentInputLanguage1 = "English") : (currentOutputLanguage1 = "English")
                } label: {
                    Text(LocalizedStringKey("English").stringValue() + " 🇬🇧")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "Dutch") : (currentOutputLanguage1 = "Dutch")
                } label: {
                    Text(LocalizedStringKey("Dutch").stringValue() + " 🇳🇱")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "German") : (currentOutputLanguage1 = "German")
                } label: {
                    Text(LocalizedStringKey("German").stringValue() + " 🇩🇪")
                }
                Button {
                    isEnabled ? (currentInputLanguage1 = "French") : (currentOutputLanguage1 = "French")
                } label: {
                    Text(LocalizedStringKey("French").stringValue() + " 🇫🇷")
                }
            } label: {
                // prints Localized value of `KEY_NAME_HERE`
                // DOESNT print `KEY_NAME_HERE`
                HStack {
                    
                    Text(outputLanguageSelectorDisabled ? LocalizedStringKey("Improved").stringValue() : selectedLanguage).font(.title2).fontWeight(.bold)
                    Image(systemName: "ellipsis.message")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.primary).frame(width: 200, alignment: .leading)
            .disabled(outputLanguageSelectorDisabled)
            
            ZStack(alignment: .top) {
                let displayText = isEnabled ? typeHereText : ""
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

extension LocalizedStringKey {
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey!, locale: locale)
    }
}
