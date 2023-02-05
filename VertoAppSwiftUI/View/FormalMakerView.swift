//
//  FormalMakerView.swift
//  VertoAppSwiftUI
//
//  Created by Joram Kwetters on 31/01/2023.
//

import SwiftUI

struct FormalMakerView: View {
    @State var translateInput: String = ""
    @State var translateOutput: String = ""
    @State var currentInputLanguage: String = "English"
    @State var currentOutputLanguage: String = "German"
    @ObservedObject var viewModel = ChatGptViewModel()
    @State private var showWelcomeView = false
    @State private var showMoreOptions = false
    @State private var showSettingsSheet = false
    @State private var sheetHeight:CGFloat = 250
    @State private var showEasterEgg = false
    @State private var TitleClicks = 0
    
    
    
    var animation: Animation {
        Animation.linear
    }

    var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    formalTitle
                    Spacer()
                   // moreOptions
                   //settingsView
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
               
                inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

                inputTextField(isEnabled: false, selectedLanguage: "")
                              
                Spacer()
                optionButtons
                    .padding(.bottom, 35)
                
            }
        }
        .onAppear {
            viewModel.setup()
        }
        .padding()
    }
    
    func send() {
        guard !translateInput.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        viewModel.send(text: "Make this " + currentInputLanguage + " text more formal: " + translateInput) { response in
            DispatchQueue.main.async {
                translateOutput = response
            }
        }
    }
    
    
}


struct FormalMakerView_Previews: PreviewProvider {
    static var previews: some View {
        FormalMakerView()
    }
}

extension FormalMakerView{
     
    private func inputTextField(isEnabled: Bool, selectedLanguage: String) -> some View{
        VStack(alignment: .leading) {
            if(isEnabled){
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
            }
            
            ZStack(alignment: .top) {
                let displayText = isEnabled ? "Type your text" : ""
               
                TextField(displayText, text: (isEnabled ? $translateInput : $translateOutput), axis: .vertical)
                    .disabled(!isEnabled)
                    .padding(5)
                    .padding(.top, 5)
                    .disableAutocorrection(true)
                    
                    
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
    
    var formalTitle: some View {
            Text("Formal")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(5)
                .padding(.leading, 10)
    }
    
    var moreOptions: some View {
        NavigationView {
            ZStack {
                Color.blue
                VStack {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 0, height: 0)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Menu {
                                    Button(action: {
                                        showMoreOptions.toggle()
                                    }, label:{
                                        Label("Language Improver", systemImage: "plus.message.fill")
                                    })
                                    .sheet (isPresented: $showMoreOptions){
                                      
                                    }
                                    
                                    Button(action: {}, label:{
                                        Label("Formal Maker", systemImage: "checkmark.message.fill")
                                    })
                                    
                                    Button(action: {}, label:{
                                        Label("Text Finisher", systemImage: "ellipsis.message.fill")
                                    })
                                } label: {
                                    Image(systemName: "ellipsis.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .background(.blue)
                                }
                                .foregroundColor(.black)
                            }
                        }
                }
            }
            .frame(width: 50, height: 100)
            .background(.blue)
        }
        .frame(width: 50, height: 40)
    }
       
    
    var languagePicker: some View{
        HStack{
            Menu {
                Button {
                   
                } label: {
                    Text("English 🇬🇧")
                   
                }
                Button {
                    
                } label: {
                    Text("Dutch 🇳🇱")
                    
                }
                Button {
                    
                } label: {
                    Text("German 🇩🇪")
                    
                }
                Button {
                   
                } label: {
                    Text("French 🇫🇷")
                    
                }
            } label: {
                HStack(){
                    Text("Change Native Language")
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
    
    var lightDarkModeSelector: some View{
        HStack{
            HStack{
                Menu {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Light ")
                            Image(systemName: "lightbulb")
                        }
                        
                    }
                    HStack {
                        Button {
                           
                        } label: {
                            Text("Dark ")
                            Image(systemName: "lightbulb.fill")
                        }
                    }
                    HStack {
                        Button {
                           
                        } label: {
                            Text("Device default ")
                            Image(systemName: "iphone.gen3")
                        }
                    }
                    
                } label: {
                    HStack(){
                        Text("Change Mode")
                            .font(.subheadline)
                           .fontWeight(.bold)
                           
                        Image(systemName: "lightbulb")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)

                }.foregroundColor(.primary)
                    .frame(width: 170, alignment: .leading)
                
            }
            .frame(width: 170, height: 55)
            .background(Color("LightGraybackground"))
            .cornerRadius(10)
        }
        .frame(width: 170, height: 55)
        .background(Color("LightGraybackground"))
        .cornerRadius(10)
    }
    
    var settingsView: some View{
        Button(action: {
            showSettingsSheet.toggle()
            
        }, label: {
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                .padding(.horizontal, 10)
                .rotationEffect(Angle.degrees(showSettingsSheet ? 90 : 0))
                .animation(animation)
        })
        .sheet(isPresented: $showSettingsSheet, content: {
            VStack() {
                HStack(){
                    Image(systemName: "xmark")
                        .onTapGesture(perform: {
                            showSettingsSheet = false;
                        })
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 10)
                .padding(.bottom, 10)
                
                HStack() {
                    VStack() {
                        VStack {
                            ZStack(alignment: .bottomTrailing) {
                                Image(systemName: "person")
                                  .resizable()
                                  .frame(width: 50, height: 50)
                                  .foregroundColor(.white)
                                  .padding(15)
                                  .background(Color.black)
                              .clipShape(Circle())
                            }
                            HStack {
                                Text("@JeromeNL")
                                
                            }
                        }
                       
                        VStack{
                            VStack{
                                Text("Active since: ")
                                    .fontWeight(.semibold)
                                Text("25-02-2023")
                            }
                            .padding(.top, 10)
                           
                            VStack{
                                Text("Native language:")
                                    .fontWeight(.semibold)
                                Text("Dutch 🇳🇱")
                            }
                           
                        }
                       
                    }
                    .frame(width: 170, height: 260)
                    .background(Color("LightGraybackground"))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                   
                    
                    VStack{
                        // NATIVE LANGUAGE SELECTOR
                        languagePicker
                        
                        // DARK/LIGHT MODE
                        lightDarkModeSelector
                        
                        HStack{
                            Button(action: {
                               
                            }, label: {
                                Link(destination: URL(string: "https://github.com/jeromenl")!) {
                                    Text("Source Code")
                                       .font(.subheadline)
                                       .fontWeight(.bold)
                                    Image(systemName: "text.justify")
                                }
                                .foregroundColor(.primary)
                               
                            })
                            
                        }
                        .frame(width: 170, height:55)
                        .background(Color("LightGraybackground"))
                        .cornerRadius(10)
                        
                        HStack{
                            Text("Logout")
                                .font(.subheadline)
                               .fontWeight(.bold)
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .frame(width: 170, height: 55)
                        .background(Color("LightGraybackground"))
                        .cornerRadius(10)
                    }
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                }
            }
            .scrollDisabled(true)
            .presentationDetents([.height(325)])
        })
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
    
  