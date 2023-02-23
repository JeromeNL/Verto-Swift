import SwiftUI

@main
struct VertoAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
               //ImageAiView()
                var swiftUISpeech = SwiftUISpeech()
                HomeView().environmentObject(swiftUISpeech)
                //MainNewsView()
            }
        }
    }
}
