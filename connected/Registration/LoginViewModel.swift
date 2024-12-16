

import Foundation
import FirebaseAuth

struct UserData {
    var email: String
    var password: String
}

class LoginViewModel: ObservableObject {
    @Published var isLogin = false
    @Published var errorMessage: String?
    @Published var isLoading = false // Для отображения состояния загрузки
    
    func registerNewUser(user: UserData) {
        guard isValidEmail(user.email) else {
            errorMessage = "Введите корректный email"
            return
        }
        
        guard user.password.count >= 6 else {
            errorMessage = "Пароль должен содержать минимум 6 символов"
            return
        }
        
        isLoading = true
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    result?.user.sendEmailVerification()
                    self?.isLogin = true
                }
            }
        }
    }
    
    func login(email: String, password: String) {
        guard isValidEmail(email) else {
            errorMessage = "Введите корректный email"
            return
        }
        
        guard password.count >= 6 else {
            errorMessage = "Пароль должен содержать минимум 6 символов"
            return
        }
        
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    self?.isLogin = true
                }
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func resetPassword(email: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, error)
                } else {
                    completion(true, nil)
                }
            }
        }
    }
    
}
