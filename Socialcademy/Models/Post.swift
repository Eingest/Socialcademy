//
//  Post.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 27.06.22.
//

import Foundation

struct Post: Identifiable {
    var title: String
    var content: String
    var authorName: String
    var timestamp = Date()
    var id = UUID()
    
    func containts(_ string: String) -> Bool {
        let properties = [title, content, authorName].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post {
    static let testPost = Post(
        title: "Lorem ipsum",
        content: "Lorem ipsum dolor sit amet, conectetut adipiscing elit, sed do eiusmod tempor nicdidunt ut labore et dolore magna aliqua.",
        authorName: "Jamie Harris"
    )
}
