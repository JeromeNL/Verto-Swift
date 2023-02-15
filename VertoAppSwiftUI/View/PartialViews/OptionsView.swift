import SwiftUI

struct OptionsView: View {
    @State private var showMoreOptions = false
    @State private var showImprover = false
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
                                            print("IMPROVER")
                                            showMoreOptions.toggle()
                                        }, label:{
                                            Label("Language Improver", systemImage: "plus.message.fill")
                                        })
                                        
                                        Button(action: {
                                            print("FORMAL")
                                        }, label:{
                                            Label("Formal Maker", systemImage: "checkmark.message.fill")
                                        })
                                        
                                        Button(action: {
                                            print("FINISHER")
                                        }, label:{
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
