//
//  UserObject.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 23/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation

struct UserObject: CreateFromArray{
    
    let userDetailsUrl  : String

    init(userDetailsUrl:String){
        self.userDetailsUrl  = userDetailsUrl
       
    }
    
    
    init?(json: JsonDictionay) {
        
        let userDetailsUrl   = json["url"] as? String ?? ""
       
        //
        //
        self.init(userDetailsUrl:userDetailsUrl)
    }
}
