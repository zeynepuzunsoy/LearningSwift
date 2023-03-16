//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Zeynep Uzunsoy on 16.03.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var  email = ""
    var username = ""
    
    private init(){
        
    }
}
