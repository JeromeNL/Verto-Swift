import SwiftUI

struct GeneralView: View {
    let translate:LocalizedStringKey = "Translate"
    let article:LocalizedStringKey = "Article"
    let synonyms:LocalizedStringKey = "Synonyms"
    let improver:LocalizedStringKey = "Improver"
    let finisher:LocalizedStringKey = "Finisher"
    let formal:LocalizedStringKey = "Formal"
    let news:LocalizedStringKey = "news"
    let speech:LocalizedStringKey = "Speech"
    
    var body: some View {
        
        VStack {
            bottomMenuItemsGeneral
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}


extension GeneralView{
    
    var bottomMenuItemsGeneral: some View {
        TabView {
             var swiftUISpeech = SwiftUISpeech()
            HomeView().environmentObject(swiftUISpeech)
                .tabItem{
                    Image(systemName: "mic")
                    Text(speech)
                }
            TranslateView()
                .tabItem {
                    Image(systemName: "ellipsis.message.fill")
                    Text(translate)
            }
            ArticleView()
                .tabItem {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                    Text(article)
            }
//            SynonymsView()
//                .tabItem {
//                    Image(systemName: "book")
//                    Text(synonyms)
//            }
            LanguageImproverView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    Text(improver)
                }
            TextFinisherView()
                .tabItem{
                    Image(systemName: "play")
                    Text(finisher)
                }
            FormalMakerView()
                .tabItem{
                    Image(systemName: "graduationcap")
                    Text(formal)
                }
            MainNewsView()
                .tabItem{
                    Image(systemName: "newspaper")
                    Text(news)
                }
            ImageAiView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("Image Detection")
                }
         }
    }
}


