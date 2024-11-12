//
//  ApiClient.swift
//  core_data
//
//  Created by artmac on 12/11/24.
//

import Foundation
import Alamofire

protocol ApiClientProtocol{
    func request<T: Decodable>(url: String, methode: HTTPMethod, parameter: Parameters?, header: HTTPHeaders?, parameterEncoding: ParameterEncoding?, completion: @escaping (Result<T, ApiError>) -> Void)
}

class ApiClient: ApiClientProtocol{
    
    func request<T>(url: String, methode:HTTPMethod = .get, parameter: Parameters? = nil, header: HTTPHeaders? = nil, parameterEncoding: ParameterEncoding? = JSONEncoding.default,completion: @escaping (Result<T, ApiError>) -> Void) where T : Decodable {
        guard let url = URL(string: url) else {return}
        AF.request(url, method: methode, parameters: parameter, encoding: parameterEncoding ?? JSONEncoding.default, headers: header).validate().responseDecodable(of: T.self) { result in
            switch result.result{
            case .success:
                guard let data = result.data else{
                    completion(.failure(.invalidResponse))
                    return
                }
                do{
                    
                    let jsonDecoding = JSONDecoder()
                    let data = try jsonDecoding.decode(T.self, from: data)
                    completion(.success(data))
                }catch{
                    completion(.failure(.invalidResponse))
                }
            case .failure(let error):
                completion(.failure(.invalidResponse))
            }
        }
    }
    
    
}
