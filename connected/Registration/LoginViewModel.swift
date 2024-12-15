//
//  LoginViewModel.swift
//  connected
//
//  Created by Artem Podorozhniy on 15.12.2024.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var isLogin = false
    @Published var errorMessage: String?
    
    func register(email: String, password: String) {
        FirebaseManager.shared.registNewUser(email: email, password: password) { [weak self] result in
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
