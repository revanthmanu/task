//
//  GitUserRepository.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation

enum  ItemDataResponse {
    case success(result: UserobjectsList)
    case failure
}

enum  userDetailsDataResponse {
    case success(result: JsonDictionay)
    case failure
}

class GitUserRepository: BaseService {
    
    func getUserList(queryString:String,completion: @escaping (ItemDataResponse) -> Void ) {
        let endPoint = String(format: "/search/users?q=%@", queryString)

        super.callEndPoint(endPoint:endPoint) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                strongSelf.parseResult(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    func getUserDetailsList(endPoint:String,completion: @escaping (userDetailsDataResponse) -> Void ) {
        
        super.userDetailsEndPoint(endPoint:endPoint) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let result):
                strongSelf.parseResult1(result: result, completion: completion)
                break
            default:
                completion(.failure)
                break
            }
            
        }
    }
    
    private func parseResult(result: JsonDictionay,completion: @escaping (ItemDataResponse) -> Void) {
        
        guard let data = UserobjectsList(json: result) else {
            completion(.failure)
            return
        }
        
        completion(.success(result: data))
    }
    
    private func parseResult1(result: JsonDictionay,completion: @escaping (userDetailsDataResponse) -> Void) {
        
//        guard let data = UserDetailsObjectsList(json: result) else {
//            completion(.failure)
//            return
//        }
        
        completion(.success(result: result))
    }
    
    
    
    
}
