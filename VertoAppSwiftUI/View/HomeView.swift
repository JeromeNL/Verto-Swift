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
    @ObservedObject var viewModel = ChatGptViewModel()
    @State private var showWelcomeView = false
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
                    translateTitle
                    Spacer()
                    moreOptions
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
                            //.background(Color.green)
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
                                        //.background(Color.red)
                                        HStack {
                                            Text("@JeromeNL")
//                                                Image(systemName: "pencil")
//                                                    .resizable()
//                                                .frame(width: 17, height: 17)
                                            
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
                                
                                VStack{
                                    // NATIVE LANGUAGE SELECTOR
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
                                    
                                    // DARK/LIGHT MODE
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
                                    
                                    HStack{
                                        Text("TEST")
                                    }
                                    .frame(width: 170, height: 55)
                                    .background(Color("LightGraybackground"))
                                    .cornerRadius(10)
                                    
                                    HStack{
                                        Text("TEST")
                                    }
                                    .frame(width: 170, height:55)
                                    .background(Color("LightGraybackground"))
                                    .cornerRadius(10)
                                }
                                
                            }
                        }
                        .scrollDisabled(true)
                        .presentationDetents([.height(325)])

                            
                    })
                        
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
               
                inputTextField(isEnabled: true, selectedLanguage: currentInputLanguage)
                    .onSubmit {
                        send()
                    }

                inputTextField(isEnabled: false, selectedLanguage: currentOutputLanguage)
                              
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
        viewModel.send(text: "Translate "+translateInput+" from "+currentInputLanguage+" to "+currentOutputLanguage) { response in
            DispatchQueue.main.async {
                translateOutput = response
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
    
    var translateTitle: some View {
        Button(action: {
            TitleClicks += 1
            if(TitleClicks == 5){
                showEasterEgg = true
            } else if(TitleClicks > 5){
                TitleClicks = 1
            }
            
        }, label: {
            Text("Translate")
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
    
    var moreOptions: some View {
        Button(action: {
                showWelcomeView.toggle()

        }, label: {
            Image(systemName: "menubar.arrow.up.rectangle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
                .padding(.horizontal, 0)
                .rotationEffect(Angle.degrees(showWelcomeView ? 180 : 0))
                .animation(animation)

        })
        .sheet(isPresented: $showWelcomeView, content: {

            VStack() {
                

                Spacer()
            }
            .scrollDisabled(true)
            .presentationDetents([.height(CGFloat(sheetHeight))])
            .cornerRadius(20)

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
    
  
