//
//  RequestParamBuilder.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

class RequestParamBuilder {
    
    private var params: [[String : Any]]? = [[:]]
    
    func append(key: String, value: Any) -> RequestParamBuilder {
        params?.append([key : value])
        return self
    }
    
    func append(_ param: [String : Any]) -> RequestParamBuilder {
        params?.append(param)
        return self
    }
    
    func build() -> [String : Any]? {
        params?
            .flatMap { $0 }
            .reduce(into: [:]) { $0[$1.key] = $1.value }
    }
    
}
