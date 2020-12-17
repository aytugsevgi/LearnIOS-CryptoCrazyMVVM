//
//  Webservice.swift
//  CryptoCrazy
//
//  Created by aytug on 15.12.2020.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) ->Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error")
                return
            }
            guard data != nil else {
                print("empty data")
                return
            }
            do{
                let cryptoList = try JSONDecoder().decode([CryptoCurrency].self, from: data!)
                print(cryptoList)
                completion(cryptoList)
            }
            catch{
                print("error")
            }
            
            
        }.resume()
        
    }
}
