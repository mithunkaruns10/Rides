//
//  NetworkManager.swift
//  Rides
//
//  Created by Mithun Karun Suma on 2022-11-02.
//

import Foundation

class NetworkManager {
    
    ///Singleton for networking
    static let sharedManager = NetworkManager()
    
    var baseUrl: String
    var urlSession: URLSession
    var task: URLSessionDataTask?
    
    //MARK: - Prvate init
    private init() {
        self.baseUrl = URLEndPoint.baseUrl
        self.urlSession = URLSession(configuration: .default)
    }
    
    //MARK: - Network Call
    func makeNetworkCall<T: Codable>(_ endPoint: String,
                            completion: @escaping ((Result<T, NetworkError>)-> Void)) {
        ///Create the full url
        guard let url = URL(string: baseUrl + endPoint) else {
            completion(.failure(NetworkError.invalidURL(message: Constant.InvalidUrl)))
            return
        }
        
        ///Cancel any previous call if exist.
        ///We will have a new request for another set of vehicles
        task?.cancel()
        
        ///Create a new dataTask
        task = urlSession.dataTask(with: url,
                                   completionHandler: { [weak self] data, response, err in
            
            ///Check for API Errors
            if let err = err {
                completion(.failure(.apiError(message: "API Failed with error: \(err.localizedDescription)")))
            }
            ///Get data and JSON Parsing
            guard let data = data else { return }
            
            do {
                
                let result = try JSONDecoder().decode(T.self,
                                                      from: data)
                completion(.success(result))
                
            } catch let jsonErr {
                completion(.failure(.parseError(message: "JSON Parsing failed with error: \(jsonErr.localizedDescription)")))
            }
        })
        
        task?.resume()
    }
}
