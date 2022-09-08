//
//  NetworkService.swift
//  newsAPP
//
//  Created by Cenk Bahadır Çark on 8.09.2022.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchNews(url: String, completion: @escaping (NewsResponse) -> ()){
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url){ data, response ,error in
                if let data = data {
                    do{
                        let newResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(newResponse)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }else{
                    print("no data")
                }
            }.resume()
        }else{
            print("invalid URL")
        }
    }
}
