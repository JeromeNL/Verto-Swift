//
//  TitleEasterEggView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct TitleEasterEggView: View {
    
    
    @State private var TitleClicks = 0
    @State private var showEasterEgg2 = false
    var translateTitleText:LocalizedStringKey = "empty"
    
    init(displayTitle:String) {
        translateTitleText = LocalizedStringKey(displayTitle);
    }
    
    var body: some View {
            
        HStack {
            Button(action: {
                    TitleClicks += 1
                    if(TitleClicks == 5){
                        showEasterEgg2 = true
                    } else if(TitleClicks > 5){
                        TitleClicks = 1
                    }
                    
                }, label: {
                    Text(translateTitleText)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(5)
                        //.padding(.leading, 10)
                        .frame(width: 175)
                })
                .sheet(isPresented: $showEasterEgg2 , content:{
                    VStack(alignment: .leading){
                        ZStack{
                            Image(systemName: "xmark")
                                .frame(width: 20, height: 20)
                                .padding(.top, 15)
                                .padding(.leading, 15)
                                .onTapGesture(perform: {
                                    showEasterEgg2 = false
                                })
                        }
                            ContentView()
                    }
            })
            Spacer()
        }
        }
    
}

struct TitleEasterEggView_Previews: PreviewProvider {
    static var previews: some View {
        TitleEasterEggView(displayTitle: "testje")
    }
}
