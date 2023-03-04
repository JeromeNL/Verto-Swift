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


