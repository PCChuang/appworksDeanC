//
//  LoginType.swift
//  week3_assignment
//
//  Created by PoChieh Chuang on 2021/8/11.
//

import Foundation
import UIKit

class LoginEntry {
    
    enum LoginType: Int {
        case login, signup
    }
    
    var type = LoginEntry.LoginType.login
    var account = ""
    var password = ""
    var check = ""
    
    func accountIsInvalid() -> Bool {
        return (account.isEmpty)
    }

    func passwordIsInvalid() -> Bool {
        return (password.isEmpty)
    }

    func checkIsInvalid() -> Bool {
        return (check.isEmpty)
    }
    
}
