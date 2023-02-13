//
//  LightSelecterView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct LightSelecterView: View {
    @Binding var lightSelectorBinding: String
    var body: some View {
            HStack{
                HStack{
                    Menu {
                        HStack {
                            Button {
                                self.lightSelectorBinding = "light"
                            } label: {
                                Text("Light ")
                                Image(systemName: "lightbulb")
                            }
                            
                        }
                        HStack {
                            Button {
                                self.lightSelectorBinding = "dark"
                            } label: {
                                Text("Dark ")
                                Image(systemName: "lightbulb.fill")
                            }
                        }
                        HStack {
                            Button {
                                self.lightSelectorBinding = "device"
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
                            
                            if(self.lightSelectorBinding == "light"){
                                Image(systemName: "lightbulb")
                            } else if (self.lightSelectorBinding == "dark"){
                                Image(systemName: "lightbulb.fill")
                            } else if(self.lightSelectorBinding == "device"){
                                Image(systemName: "iphone.gen3")
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
        
    }
}

//struct LightSelecterView_Previews: PreviewProvider {
//    static var previews: some View {
//        LightSelecterView()
//    }
//}
