//
//  PostsList.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 27.06.22.
//

import SwiftUI

struct PostsList: View {
    @State private var searchText = ""
    private var posts = [Post.testPost]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                if searchText.isEmpty || post.containts(searchText) {
                    PostRow(post: post)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Posts")
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
