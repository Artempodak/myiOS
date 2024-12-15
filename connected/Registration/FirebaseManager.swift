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
    
    func registNewUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            result?.user.sendEmailVerification(completion: { emailError in
                if let emailError = emailError {
                    completion(.failure(emailError))
                } else {
                    completion(.success(()))
                }
            })
        }
    }
    
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

struct UserData {
    var email: String
    var password: String
}
