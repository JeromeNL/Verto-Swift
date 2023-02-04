import Foundation




final class UrbanViewModel: ObservableObject {
    init() {}
    
    let headers = [
        "X-RapidAPI-Key": "6260f52009msh089d2346ca28e4dp1ed43bjsnca1884a4dbf7",
        "X-RapidAPI-Host": "urban-dictionary7.p.rapidapi.com"
    ]
    
    func send(text: String) -> Void {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://urban-dictionary7.p.rapidapi.com/v0/define?term=yeet")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
            } else {
                let _httpResponse = response as? HTTPURLResponse
                 }
        })
        
        dataTask.resume()
    }
}

