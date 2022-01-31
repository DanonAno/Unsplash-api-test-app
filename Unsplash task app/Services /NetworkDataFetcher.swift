//
//  NetworkDataFetcher.swift
//  Unsplash task app
//
//  Created by  Даниил on 31.01.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (searchResults?) -> () ) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error recived requesting data:\(error.localizedDescription)")
                completion(nil)
            }
            let decoded = self.decodeJSON(type: searchResults.self, from: data)
            completion(decoded)
        }
    }
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON, \(jsonError)")
            return nil
        }
    }
}
//
