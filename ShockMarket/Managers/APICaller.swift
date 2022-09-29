//
//  APICaller.swift
//  ShockMarket
//
//  Created by Abdurrahman Gazi Yavuz on 29.09.2022.
//

import Foundation



struct Constants{
    
    static let BASE_URL     = "https://api.ceptesok.com/api/customlists/95/products?stock=true&page=1&batchSize=12&fromIndex=0"
    
}

enum APIError: Error{
    case failedToGetData
}


struct APICaller{
    
    static let shared   = APICaller()
    
    func getProducts(completion: @escaping (Result<Products, Error>) -> Void){
        
        guard let url       = URL(string: "\(Constants.BASE_URL)") else {return}
        
        let task            = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            do{
                
                let results     = try JSONDecoder().decode(Payload.self, from: data)
                completion(.success(results.payload))
                
            }catch{
                print("erorrr")
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
}
