//
//  User.swift
//  callBack_swiftUI
//
//  Created by Tung Viet on 08/11/2023.
//

import Foundation
import SwiftUI

class User {
    var avatar: Image
    var name: String
    var age: Int
    init(avatar: Image, name: String, age: Int) {
        self.avatar = avatar
        self.name = name
        self.age = age
    }
}

let dataUser: [User] = [
    User(avatar: Image(uiImage: UIImage(named: "voice1")!), name: "AAA", age: 19),
    User(avatar: Image(uiImage: UIImage(named: "voice2")!), name: "BBB", age: 20)

]
