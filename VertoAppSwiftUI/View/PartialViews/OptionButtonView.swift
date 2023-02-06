
import SwiftUI

struct OptionButtonView: View {
    var body: some View {
            HStack{
                functionButtonItem(widthHeight: 60, icon: "book").onTapGesture {
                    print("test")
                }
                    .padding(.horizontal, 10)
                functionButtonItem(widthHeight: 80, icon: "mic")
                functionButtonItem(widthHeight: 60, icon: "speaker.wave.2")
                    .padding(.horizontal, 10)
                
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.white)
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

struct OptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OptionButtonView()
    }
}
