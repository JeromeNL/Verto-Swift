//
//  GeneralView.swift
//  VertoAppSwiftUI
//
//  Created by Joram Kwetters on 31/01/2023.
//

import SwiftUI

struct GeneralView: View {
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
                    Text("Translate")
            }
            ArticleView()
                .tabItem {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                    Text("Article")
            }
            SynonymsView()
                .tabItem {
                    Image(systemName: "book")
                    Text("synonyms")
            }
        }
    }
    
//    var sideMenuView: some View{
//
//    }
}




