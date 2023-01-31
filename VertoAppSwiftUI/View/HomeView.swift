//
//  HomeView.swift
//  VertoAppSwiftUI
//
//  Created by Joram Kwetters on 31/01/2023.
//

import SwiftUI

struct HomeView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    
    var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    Text("Translate")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    .padding(5)
                    .padding(.leading, 10)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                
               
                inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                inputTextField(isEnabled: false, selectedLanguage: currentOutputLanguage)
                Spacer()
                optionButtons
                    .padding(.bottom, 35)
                
                
               
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView{
     
    private func inputTextField(isEnabled: Bool, selectedLanguage: String) -> some View{
        VStack(alignment: .leading) {
            Menu {
                Button {
                    isEnabled ? (currentInputLanguage = "English") : (currentOutputLanguage = "English")
                } label: {
                    Text("English 🇬🇧")
                   
                }
                Button {
                    isEnabled ? (currentInputLanguage = "Dutch") : (currentOutputLanguage = "Dutch")
                } label: {
                    Text("Dutch 🇳🇱")
                    
                }
                Button {
                    isEnabled ? (currentInputLanguage = "German") : (currentOutputLanguage = "German")
                } label: {
                    Text("German 🇩🇪")
                    
                }
                Button {
                    isEnabled ? (currentInputLanguage = "French") : (currentOutputLanguage = "French")
                } label: {
                    Text("French 🇫🇷")
                    
                }
            } label: {
                HStack(){
                    Text(selectedLanguage)
                        .font(.title2)
                       .fontWeight(.bold)
                       
                    Image(systemName: "ellipsis.message")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }.foregroundColor(.primary)
                .frame(width: 200, alignment: .leading)
                //.background(Color.red)
            
            ZStack(alignment: .top) {
                let displayText = isEnabled ? "Type your text" : ""
               
                TextField(displayText, text: (isEnabled ? $translateInput : $translateOutput), axis: .vertical)
                    .disabled(!isEnabled)
                    .padding(5)
                    .padding(.top, 5)
                    //.background(Color.red)
                    
            }
            .frame(width: 350, height: 175, alignment: .top)
            .background()
            .cornerRadius(15)
        .shadow(color: Color.gray, radius: 5.0, x: 0, y: 5)
        }
        .padding(.top, 10)
        
    }
    
    var optionButtons: some View {
        HStack{
            functionButtonItem(widthHeight: 60, icon: "book")
                .padding(.horizontal, 10)
            functionButtonItem(widthHeight: 80, icon: "mic")
            functionButtonItem(widthHeight: 60, icon: "speaker.wave.2")
                .padding(.horizontal, 10)
            
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
    
    private func functionButtonItem(widthHeight: Double, icon: String) -> some View{
        Button(action: {
            
        }, label: {
            ZStack {
                Circle()
                    .fill(.blue)
                .frame(width: widthHeight, height: widthHeight)
                .shadow(radius: 5, x: 0, y: 5)
                
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (widthHeight / 3), height: (widthHeight / 2.5))
                    .foregroundColor(Color.white)
            }
        })
    }
}
    
  
