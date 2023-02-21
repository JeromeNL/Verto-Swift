import Foundation
import SwiftUI

struct languageToLocal{
    let english:LocalizedStringKey = "English";
    let dutch:LocalizedStringKey = "Dutch";
    let german:LocalizedStringKey = "German";
    let french:LocalizedStringKey = "French";
    
    let defaults = UserDefaults.standard
    
    func englishNameToLocal(englishLangName: String) -> String{
        return LocalizedStringKey(englishLangName).stringValue()
    }
    
    func stringToLocalLanguage(englishName: String) -> String{
        return Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        
    }
}


extension LocalizedStringKey {
    var stringKey3: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
}

extension String {
    static func localizedString3(for key: String,
locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}

extension LocalizedStringKey {
    func stringValue3(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey!, locale: locale)
    }
}
