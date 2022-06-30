//
//  PostsViewModel.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 28.06.22.
//

import Foundation

//Mainactor -> Update the PostsViewModel only from the main thread -> prevents bugs and undefined behavior
@MainActor
class PostsViewModel: ObservableObject {
    @Published var posts = [Post.testPost]
    
    func makeCreateAction() -> NewPostForm.CreateAction {
        return { [weak self] post in
            try await PostsRepository.create(post)
            self?.posts.insert(post, at: 0)
        }
    }
}
