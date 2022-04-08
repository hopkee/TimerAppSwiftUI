//
//  UserManager.swift
//  TimerSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import Combine
import Foundation
import SwiftUI

class UserManager: ObservableObject {
    
    @AppStorage("userRegistered") var isRegister = false
    @AppStorage("username") var name: String = ""

    
    static func deleteUser() {
        UserDefaults.standard.removeObject(forKey: "userRegistered")
    }
    
}
