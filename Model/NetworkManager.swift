//
//  NetworkManager.swift
//  H4R News
//
//  Created by Santhosh Kumar on 14/12/21.
//

import Foundation
class NetworkManager: ObservableObject{
    @Published var posts = [Posts]()
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safedata = data{
                        do{
                        let results = try decoder.decode(Results.self, from: safedata)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                    
                        }catch{
                            print(error)
                        }
                        }
                    }
            })
            task.resume()
}
}
}
                                        
