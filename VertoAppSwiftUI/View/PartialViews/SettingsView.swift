


import SwiftUI

struct SettingsView: View {
    

    //@State private var showWelcomeView = false
    //@State private var showMoreOptions = false
    @State private var showSettingsSheet2 = false
    let sourceCode:LocalizedStringKey = "SourceCode"
    let logOut:LocalizedStringKey = "LogOut";
    let activeSince:LocalizedStringKey = "ActiveSince";
    let nativeLanguage:LocalizedStringKey = "NativeLanguage";
    
    //@State private var sheetHeight:CGFloat = 250
    //@State private var showEasterEgg = false
    //@State private var TitleClicks = 0
    @State var myBind = "🇳🇱"
    @State var lightSelectorBinding = "light"
    var animation: Animation {
        Animation.linear
    }


    var body: some View {
        
            Button(action: {
                showSettingsSheet2.toggle()
                
            }, label: {
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .rotationEffect(Angle.degrees(showSettingsSheet2 ? 90 : 0))
                    .animation(animation)
            })
            .sheet(isPresented: $showSettingsSheet2, content: {
                VStack() {
                    HStack(){
                        Image(systemName: "xmark")
                            .onTapGesture(perform: {
                                showSettingsSheet2 = false;
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
                                    Text(activeSince)
                                        .fontWeight(.semibold)
                                    Text("25-02-2023")
                                }
                                .padding(.top, 10)
                               
                                VStack{
                                    Text(nativeLanguage)
                                        .fontWeight(.semibold)
                                    
                                    Text(myBind)
                                }
                            }
                        }
                        .frame(width: 170, height: 260)
                        .background(Color("LightGraybackground"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                       
                        
                        VStack{
                            // NATIVE LANGUAGE SELECTOR
                            LanguagePickerView(myBindVar: $myBind)
                            
                            // DARK/LIGHT MODE
                            LightSelecterView(lightSelectorBinding: $lightSelectorBinding)
                            
                            HStack{
                                Button(action: {
                                   
                                }, label: {
                                    Link(destination: URL(string: "https://github.com/jeromenl")!) {
                                        Text(sourceCode)
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
                                Text(logOut)
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
        
    }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
