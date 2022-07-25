//
//  ErrorHandler.swift
//  Socialcademy
//
//  Created by Andreas Kiesel on 22.07.22.
//

import Foundation

@MainActor
protocol StateManager: AnyObject {
    var error: Error? { get set }
    var isWorking: Bool { get set }
}
 
extension StateManager {
    typealias Action = () async throws -> Void
    
    var isWorking: Bool {
        get { false }
        set {}
    }
    
    nonisolated func withStateManagingTask(perform action: @escaping Action) {
        Task {
            await withStateManagement(perform: action)
        }
    }
    
    private func withStateManagement(perform action: @escaping Action) async {
        isWorking = true
        do {
            try await action()
        } catch {
            print("[\(Self.self)] Error: \(error)")
            self.error = error
        }
        isWorking = false
    }
}
