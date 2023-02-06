//
//  TitleEasterEggView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct TitleEasterEggView: View {
    @State private var TitleClicks = 0
    @State private var showEasterEgg = false
    let translateTitleText:LocalizedStringKey = "translateTitleText"
    
    var body: some View {

            Button(action: {
                TitleClicks += 1
                if(TitleClicks == 5){
                    showEasterEgg = true
                } else if(TitleClicks > 5){
                    TitleClicks = 1
                }
                
            }, label: {
                Text(translateTitleText)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(5)
                    .padding(.leading, 10)
            })
            .sheet(isPresented: $showEasterEgg , content:{
                VStack(alignment: .leading){
                    ZStack{
                        Image(systemName: "xmark")
                            .frame(width: 20, height: 20)
                            .padding(.top, 15)
                            .padding(.leading, 15)
                            .onTapGesture(perform: {
                                showEasterEgg = false
                            })
                    }
                        ContentView()
                }
            })
        }
    
}

struct TitleEasterEggView_Previews: PreviewProvider {
    static var previews: some View {
        TitleEasterEggView()
    }
}
