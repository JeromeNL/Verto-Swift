import Speech
import SwiftUI
import Foundation

struct OptionButtonView: View {
    @State var isPressed:Bool = false
    @State var actionPop:Bool = false
    @EnvironmentObject var swiftUISpeech:SwiftUISpeech
    
    var body: some View {
            HStack{
               
                functionButtonItem(widthHeight: 80, icon: "mic")
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }

        private func functionButtonItem(widthHeight: Double, icon: String) -> some View{
            Button(action: {
                // Button
                    if(self.swiftUISpeech.getSpeechStatus() == "Denied - Close the App"){// checks status of auth if no auth pop up error
                        self.actionPop.toggle()
                    }else{
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.swiftUISpeech.isRecording.toggle()}// button animation
                        self.swiftUISpeech.isRecording ? self.swiftUISpeech.startRecording() : self.swiftUISpeech.stopRecording()
                    }

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
