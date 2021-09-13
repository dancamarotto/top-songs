//
//  Networking.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Alamofire
import RxSwift

protocol Networking {
    func request<T: Decodable>(url: String,
                               method: HTTPMethod,
                               parameters: [String : Any]?,
                               returnType: T.Type) -> Single<T>
}

extension Networking {
    func request<T: Decodable>(url: String,
                               method: HTTPMethod = .get,
                               parameters: [String : Any]? = nil,
                               returnType: T.Type) -> Single<T> {
        request(url: url, method: method,
                parameters: parameters, returnType: returnType)
    }
}
