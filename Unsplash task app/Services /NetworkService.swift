//
//  NetworkService.swift
//  Unsplash task app
//
//  Created by  Даниил on 31.01.2022.
//

import UIKit

class NetworkService {
    
    //Построение запроса данных по url
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void ) {
        let parametrs = self.prepareParametrs(searchTerm: searchTerm)
        let url = self.url(params: parametrs)
        print(url)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        
        //
        
        
    }
    
    private func prepareParametrs(searchTerm: String?) -> [String: String] {
        
        var parametrs = [String: String]()
        parametrs["query"] = searchTerm
        parametrs["page"] = String(1)
        parametrs["per_page"] = String(30)
        
        return parametrs
    }
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID Mdj2iA0ZG-ogG5TYHNHIstphgU21hIW0XSvcGKbuTe0"
        return headers
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map{URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from reqest: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: reqest) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
