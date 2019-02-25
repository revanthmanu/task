//
//  UserobjectsList.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation

struct UserobjectsList {
    
    var results        : [UserObject]
    
    init(results:[UserObject]){
        
        self.results   = results
    }
    
    init?(json: JsonDictionay) {
        guard let results = UserObject.createRequiredInstances(from: json , key: "items") else { return nil }
        self.init(results:results)
    }
}
