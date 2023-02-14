import SwiftUI

struct LanguagePickerView: View {
    let changeNativeText:LocalizedStringKey = "ChangeNativeText"
    let defaults = UserDefaults.standard
    let english:LocalizedStringKey = "English";
    let dutch:LocalizedStringKey = "Dutch";
    let german:LocalizedStringKey = "German";
    let french:LocalizedStringKey = "French";
    @Binding var myBindVar: String
    var body: some View {
      HStack{
                Menu {
                    Button {
                        self.myBindVar = "🇬🇧"
                        defaults.set("english", forKey: DefaultsKeys.nativeLanguage)
                    } label: {
                        Text(LocalizedStringKey("English").stringValue() + " 🇬🇧")
                    }
                    Button {
                        self.myBindVar = "🇳🇱"
                        defaults.set("dutch", forKey: DefaultsKeys.nativeLanguage)
                    } label: {
                        Text(LocalizedStringKey("Dutch").stringValue() + " 🇳🇱")
                        
                    }
                    Button {
                        self.myBindVar = "🇩🇪"
                        defaults.set("german", forKey: DefaultsKeys.nativeLanguage)
                    } label: {
                        Text(LocalizedStringKey("German").stringValue() + " 🇩🇪")
                        
                    }
                    Button {
                        self.myBindVar = "🇫🇷"
                        defaults.set("french", forKey: DefaultsKeys.nativeLanguage)
                    } label: {
                        Text(LocalizedStringKey("French").stringValue() + " 🇫🇷")
                    }
                } label: {
                    HStack(){
                        Text(changeNativeText)
                            .font(.subheadline)
                           .fontWeight(.bold)
                           
                        Image(systemName: "ellipsis.message")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)

                }.foregroundColor(.primary)
                    .frame(width: 170, alignment: .leading)
                
            }
            .frame(width: 170, height: 55)
            .background(Color("LightGraybackground"))
            .cornerRadius(10)
       
    }
}

extension LocalizedStringKey {
    var stringKey2: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}

extension String {
    static func localizedString2(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue2(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey!, locale: locale)
    }
}

