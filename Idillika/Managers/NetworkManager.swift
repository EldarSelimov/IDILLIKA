//
//  NetworkManager.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    private let host = "https://idillika.com/api/catalogList.php?section=21&session_id=f3e82db3d0b2bcce07eae17dd9cb46d3"
    
    func getProductList(succes: @escaping ([ProductModel]) -> Void,
                        error: @escaping (String) -> Void) {
        AF
            .request(host, method: .get)
            .responseDecodable { (response: DataResponse<[ProductModel], AFError>) in
                switch response.result {
                case .success(let list):
                    succes(list)
                    
                case .failure(let err):
                    error(err.localizedDescription)
                }
        }
    }
}
