//
//  PostsList.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 27.06.22.
//

import SwiftUI

struct PostsList: View {
    @State private var searchText = ""
    @State private var showNewPostForm = false
    @StateObject var viewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                if searchText.isEmpty || post.containts(searchText) {
                    PostRow(post: post)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Posts")
            .toolbar {
                Button {
                    showNewPostForm = true
                } label: {
                    Label("New Post", systemImage: "square.and.pencil")
                }

            }
        }
        .sheet(isPresented: $showNewPostForm) {
            NewPostForm(createAction: viewModel.makeCreateAction())
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
