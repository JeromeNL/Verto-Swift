import SwiftUI

struct GeneralView: View {
    let translate:LocalizedStringKey = "Translate"
    let article:LocalizedStringKey = "Article"
    let synonyms:LocalizedStringKey = "Synonyms"
    let improver:LocalizedStringKey = "Improver"
    let finisher:LocalizedStringKey = "Finisher"
    let formal:LocalizedStringKey = "Formal"
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
            HomeView()
                .tabItem {
                    Image(systemName: "ellipsis.message.fill")
                    Text(translate)
            }
            ArticleView()
                .tabItem {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                    Text(article)
            }
            SynonymsView()
                .tabItem {
                    Image(systemName: "book")
                    Text(synonyms)
            }
            LanguageImproverView()
                .tabItem{
                    Image(systemName: "book")
                    Text(improver)
                }
            TextFinisherView()
                .tabItem{
                    Image(systemName: "book")
                    Text(finisher)
                }
            FormalMakerView()
                .tabItem{
                    Image(systemName: "book")
                    Text(formal)
                }
         }
    }
}


