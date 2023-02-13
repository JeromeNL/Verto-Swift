//
//  LanguagePickerView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct LanguagePickerView: View {
    let changeNativeText:LocalizedStringKey = "ChangeNativeText"
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
                    } label: {
                        Text(LocalizedStringKey("English").stringValue() + " 🇬🇧")
                       
                    }
                    Button {
                        self.myBindVar = "🇳🇱"
                    } label: {
                        Text(LocalizedStringKey("Dutch").stringValue() + " 🇳🇱")
                        
                    }
                    Button {
                        self.myBindVar = "🇩🇪"
                    } label: {
                        Text(LocalizedStringKey("German").stringValue() + " 🇩🇪")
                        
                    }
                    Button {
                        self.myBindVar = "🇫🇷"
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

//struct LanguagePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguagePickerView(myBindVar: )
//    }
//}

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

