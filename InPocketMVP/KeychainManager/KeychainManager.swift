//
//  KeychainManager.swift
//  InPocketMVP
//
//  Created by АХМЕДОВ НИКОЛАЙ on 13/02/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import Foundation
import KeychainAccess


protocol KeychainManagerProtocol: AnyObject{
    func save(key: String, value: String)
    func load(key: String) -> Result<String, Error>
}


class KeychainManager: KeychainManagerProtocol{
    func save(key: String, value: String) {
        keychain[key] = value
    }
    
    func load(key: String) -> Result<String, Error> {
        do {
            let passcode = try keychain.getString(key) ?? ""
            return .success(passcode)
        } catch {
            return .failure(error)
        }
    }
    
    
    private let keychain = Keychain(service: "PASSCODE")
    
}

enum KeychainKeys: String{
    case passcode = "passcod3"
}
