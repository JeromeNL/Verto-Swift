import SwiftUI

@main
struct VertoAppSwiftUIApp: App {
    let defaults = UserDefaults.standard
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView{
                GeneralView()
                    .preferredColorScheme((defaults.string(forKey: DefaultsKeys.lightMode) == "dark") ? .dark : .light)
            }
        }
    }
}
