//
//  LoginViewModel.swift
//  connected
//
//  Created by Artem Podorozhniy on 15.12.2024.
//

import Foundation
import FirebaseAuth



struct UserData {
    var email: String
    var password: String
}




class LoginViewModel: ObservableObject {
    @Published var isLogin = false
    @Published var errorMessage: String?
    
    func registNewUser(user: UserData) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, err in
            guard err == nil else {
                print(err?.localizedDescription)
                return
            }
            result?.user.sendEmailVerification()
            
        }
    }
    
    func login(email: String, password: String) {
        FirebaseManager.shared.loginUser(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.isLogin = true
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    private func mapError(_ error: Error) -> String {
        return (error as NSError).localizedDescription
    }
}
