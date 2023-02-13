//
//  LanguagePickerView.swift
//  VertoAppSwiftUI
//
//  Created by janique van den oever on 06/02/2023.
//

import SwiftUI

struct LanguagePickerView: View {
    @Binding var myBindVar: String
    var body: some View {
      HStack{
                Menu {
                    Button {
                        self.myBindVar = "English 🇬🇧"
                    } label: {
                        Text("English 🇬🇧")
                       
                    }
                    Button {
                        self.myBindVar = "Dutch 🇳🇱"
                    } label: {
                        Text("Dutch 🇳🇱")
                        
                    }
                    Button {
                        self.myBindVar = "German 🇩🇪"
                    } label: {
                        Text("German 🇩🇪")
                        
                    }
                    Button {
                        self.myBindVar = "French 🇫🇷"
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
}

//struct LanguagePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        LanguagePickerView(myBindVar: )
//    }
//}
