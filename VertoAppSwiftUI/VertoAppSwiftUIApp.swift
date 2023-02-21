import SwiftUI

@main
struct VertoAppSwiftUIApp: App {
    let defaults = UserDefaults.standard
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
               //ImageAiView()
    
                GeneralView()
                    .preferredColorScheme((defaults.string(forKey: DefaultsKeys.lightMode) == "dark") ? .dark : .light)
                //MainNewsView()
            }
        }
    }
}
