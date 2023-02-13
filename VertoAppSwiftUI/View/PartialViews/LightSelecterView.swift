//
//  LightSelecterView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct LightSelecterView: View {
    @Binding var lightSelectorBinding: String
    let defaults = UserDefaults.standard
    let changeLightMode:LocalizedStringKey = "ChangeLightMode"
    let light:LocalizedStringKey = "Light"
    let dark:LocalizedStringKey = "Dark"
    let device:LocalizedStringKey = "Device"
    var body: some View {
            HStack{
                HStack{
                    Menu {
                        HStack {
                            Button {
                                self.lightSelectorBinding = "light"
                                defaults.set("light", forKey: DefaultsKeys.lightMode)
                            } label: {
                                Text(light)
                                Image(systemName: "lightbulb")
                            }
                            
                        }
                        HStack {
                            Button {
                                self.lightSelectorBinding = "dark"
                                defaults.set("dark", forKey: DefaultsKeys.lightMode)
                            } label: {
                                Text(dark)
                                Image(systemName: "lightbulb.fill")
                            }
                        }
                        HStack {
                            Button {
                                self.lightSelectorBinding = "device"
                                defaults.set("device", forKey: DefaultsKeys.lightMode)
                            } label: {
                                Text(device)
                                Image(systemName: "iphone.gen3")
                            }
                        }
                        
                    } label: {
                        HStack(){
                            Text(changeLightMode)
                                .font(.subheadline)
                               .fontWeight(.bold)
                            
                            if(lightSelectorBinding == "light"){
                                Image(systemName: "lightbulb")
                            } else if (lightSelectorBinding == "dark"){
                                Image(systemName: "lightbulb.fill")
                            } else if(lightSelectorBinding == "device"){
                                Image(systemName: "iphone.gen3")
                            } else {
                                if(defaults.string(forKey: DefaultsKeys.lightMode) == "light" ){
                                    Image(systemName: "lightbulb")
                                } else if (defaults.string(forKey: DefaultsKeys.lightMode) == "dark" ){
                                    Image(systemName: "lightbulb.fill")
                                } else if(defaults.string(forKey: DefaultsKeys.lightMode) == "device" ){
                                    Image(systemName: "iphone.gen3")
                                }
                                
                            }
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
        //Text("Text: " + defaults.string(forKey: DefaultsKeys.lightMode)!)
    }
}

//struct LightSelecterView_Previews: PreviewProvider {
//    static var previews: some View {
//        LightSelecterView()
//    }
//}
