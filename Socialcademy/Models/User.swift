//
//  User.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 18.07.22.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String
    var name: String
}

extension User {
    static let testUser = User(id: "", name: "Jamie Harris")
}
