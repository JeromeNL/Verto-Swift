import SwiftUI

struct ImageAiView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    
var body: some View {
        ZStack {
            Color("DefaultBackground")
            VStack{
                HStack() {
                    Text("ImageAis")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(5)
                        .padding(.leading, 10)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                
                NavigationView{
                    VStack{
                        if texts.count > 0{
                            List{
                                ForEach(texts){text in NavigationLink(destination:ScrollView{Text(text.content)},
                                        label: {
                                            Text(text.content).lineLimit(1)
                                        })
                                }
                            }
                        }
                        else{
                            Text("No scan yet").font(.title)
                        }
                        Spacer()
                        optionButtons
                        
                    }
                }
            }
        }
        .padding()
    }
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in if let outputText = textPerPage?.joined(separator:"\n").trimmingCharacters(in:.whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
    

struct ImageAiView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAiView()
    }
}

    var optionButtons: some View {
        HStack{
            functionButtonItem(widthHeight: 60, icon: "camera")
                .padding(.horizontal, 10).onTapGesture {
                }.sheet(isPresented: $showScannerSheet, content: {
                    self.makeScannerView()
                })
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color("LightGraybackground"))
    }
    
    private func functionButtonItem(widthHeight: Double, icon: String) -> some View{
        Button(action: {
            self.showScannerSheet = true
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
    
  
