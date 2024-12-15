//
//  FirebaseManager.swift
//  connected
//
//  Created by Artem Podorozhniy on 15.12.2024.
//




import Foundation
import FirebaseAuth

// Firebase Manager
class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() {}
    
    func loginUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }
    }
}
