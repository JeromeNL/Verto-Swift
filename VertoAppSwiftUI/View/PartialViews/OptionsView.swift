//
//  OptionsView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct OptionsView: View {
    @State private var showMoreOptions = false
    var body: some View {
        
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
        
        
    }


struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
