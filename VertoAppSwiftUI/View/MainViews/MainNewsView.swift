
import SwiftUI

struct MainNewsView: View {

    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0

    var body: some View {

        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    TitleEasterEggView(displayTitle: LocalizedStringKey("news").stringValue());
                    Spacer()
                    //OptionsView()
                    //SettingsView()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
                NewsView()
                    .opacity(opac)
            }
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
               
                
            }
        }
     
        }
     
    
    
  
    
}


struct MainNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}


    
  
