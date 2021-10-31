//
//  UserData.swift
//  UserInfoApp
//
//  Created by Test on 10/31/21.
//

import Foundation
struct User{
    var userName: String
    var userPassword: String
    var type: HobbyType
}
enum HobbyType: String {
    case reading
    case walking
    case working
    var definition: String {
        switch self {
    case.reading:
        return "I like reading fiction and non fiction literature."
    case.walking:
        return "Walking is a great way to relax"
    case.working:
        return "My work is very intersting, I'm a part of IVF team"
            }
    }
}
let A = User(userName: "A", userPassword: "1234", type: .reading)
    
