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
    let defaults = UserDefaults.standard
    let languageLocal = languageToLocal()
    
    public func inputTextField(isEnabled: Bool, outputLanguageSelectorDisabled: Bool = false, selectedLanguage: String) -> some View {
        VStack(alignment: .leading) {
            Menu {
                Button {
                    isEnabled ? (currentInputLanguage1 = "English") : (currentOutputLanguage1 = "English")
                } label: {
                    Text( LocalizedStringKey("English").stringValue() + " 🇬🇧")
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
                HStack {
                    Text(getLanguageForPicker(selectedLanguage: selectedLanguage, outputLanguageSelectorDisabled: outputLanguageSelectorDisabled))
                        .font(.title2)
                        .fontWeight(.bold)
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
                color: Color.blue,
                radius: 5.0, x: 0, y: 5)
        }
        .padding(.top, 10)
    }
}

extension TextLanguageView{
    func getLanguageForPicker(selectedLanguage: String, outputLanguageSelectorDisabled: Bool) -> String{
        if(outputLanguageSelectorDisabled){
            return LocalizedStringKey("Improved").stringValue()
        } else {
            if(selectedLanguage != ""){
                return languageLocal.englishNameToLocal(englishLangName: selectedLanguage)
            } else{
                
                return languageLocal.englishNameToLocal(englishLangName: defaults.string(forKey: DefaultsKeys.nativeLanguage)?.capitalized ?? selectedLanguage)
            }
        }
    }
}


extension LocalizedStringKey {
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}

extension String {
    static func localizedString(for key: String, locale: Locale = .current) -> String {

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
