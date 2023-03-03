import Foundation

// Je maakt een Object aan dat je wil ophalen.
struct SpaceData : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI: ObservableObject {
    
    //Initialiseer een Array met space data
    @Published var news: [SpaceData] = []
    
    func getData() {
        
        // Geef aan tegen welke url je wil praten.
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Check of er data op te halen is anders return je een error.
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Try swiping down to refresh as soon as you have internet again.", publishedAt: "Error")]
                }
                return }
            
            //Zet het opgehaalde object om in bruikbare data
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            
            // Update onze lokale lijst met de zojuist opgehaalde data.
            DispatchQueue.main.async {
                print("Loaded new data successfully! Articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}



