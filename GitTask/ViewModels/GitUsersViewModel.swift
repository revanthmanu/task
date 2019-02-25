//
//  GitUsersViewModel.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation

protocol GitUsersViewModelDelegate: class {
    func reloadTable(type: Int)
}

class GitUsersViewModel {
    var dataItems:[UserobjectsList] = []
    var userDetailsItems = [JsonDictionay]()
    var repository: GitUserRepository?
    weak var delegate: GitUsersViewModelDelegate?
    init() {
        repository = GitUserRepository()
    }
    
    func getUsersList(queryString:String) {
        guard let repo = repository else { return }
        
        repo.getUserList(queryString: queryString) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let result):
                strongSelf.dataItems .removeAll()
                strongSelf.dataItems.append(result)
                DispatchQueue.global(qos: .background).async {
                    for index in  0..<strongSelf.dataItems[0].results.count {
                        let tempString = String(format: "%@",strongSelf.dataItems[0].results[index].userDetailsUrl)
                        strongSelf.getUsersDetailsList(endpoint: tempString)
                    }
                    DispatchQueue.main.async {
                        // UI Updates here for task complete.
                    }
                }
            case.failure:
                break
            }
        }
    }
    
    func getUsersDetailsList(endpoint:String) {
        guard let repo = repository else { return }
        userDetailsItems .removeAll()
        repo.getUserDetailsList(endPoint: endpoint) { [weak self](response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let result):
//                strongSelf.userDetailsItems.append(result as)
                strongSelf.userDetailsItems.append(result)
                strongSelf.delegate?.reloadTable(type: strongSelf.dataItems.count - 1)
                break
            case.failure:
                break
            }
        }
    }
    
    
}
