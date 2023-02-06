//
//  LightSelecterView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct LightSelecterView: View {
    var body: some View {

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
}

struct LightSelecterView_Previews: PreviewProvider {
    static var previews: some View {
        LightSelecterView()
    }
}
