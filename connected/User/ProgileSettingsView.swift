import SwiftUI
import FirebaseAuth

struct ProgileSettingsView: View {
    
    @Environment(\.dismiss) var dismiss // Для закрытия представления
    @State private var isEditing = false // Управляет режимом редактирования
    @State private var newEmail = "" // Для хранения нового email
    @State private var showAlert = false // Для отображения уведомлений
    @State private var alertMessage = "" // Сообщение для уведомления
    
    var userEmail: String {
        Auth.auth().currentUser?.email ?? "Неизвестно"
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.bg, .dark], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Ваша почта")
                            .foregroundColor(.lightgray)
                            .font(.title2)
                        
                        if isEditing {
                            // Поле для ввода нового email
                            TextField("Введите новый email", text: $newEmail)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .padding(15)
                                .background(Color.white.opacity(0.4))
                                .cornerRadius(12)
                        } else {
                            // Отображение текущего email
                            HStack {
                                Text(userEmail)
                                    .bold()
                                    .foregroundColor(.lightgray)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(12)
                        }
                    }
                    Spacer()
                    
                    // Кнопка "Сохранить" внизу экрана
                    if isEditing {
                        Button(action: {
                            updateEmail()
                        }) {
                            Text("Сохранить")
                                .foregroundColor(.lightgray)
                                .fontWeight(.medium)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(LinearGradient(colors: [.dark, .bg], startPoint: .topTrailing, endPoint: .bottomLeading))
                                .cornerRadius(12)
                        }
                        .padding(.bottom)
                    }
                }
                .padding()
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Закрыть") {
                        dismiss() // Закрываем представление
                    }
                    .foregroundColor(.accentColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isEditing ? "Отмена" : "Изм.") {
                        if isEditing {
                            // Отмена редактирования
                            isEditing = false
                            newEmail = "" // Сбрасываем введенный email
                        } else {
                            // Вход в режим редактирования
                            isEditing = true
                        }
                    }
                    .foregroundColor(.accentColor)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Информация"), message: Text(alertMessage), dismissButton: .default(Text("ОК")))
            }
        }
    }
    
    /// Метод для обновления email в Firebase
    private func updateEmail() {
        guard !newEmail.isEmpty else {
            alertMessage = "Введите новый email."
            showAlert = true
            return
        }
        
        Auth.auth().currentUser?.updateEmail(to: newEmail) { error in
            if let error = error {
                alertMessage = "Ошибка: \(error.localizedDescription)"
            } else {
                alertMessage = "Email успешно обновлен."
                isEditing = false // Завершаем редактирование
                newEmail = "" // Сбрасываем поле ввода
            }
            showAlert = true
        }
    }
}

#Preview {
    ProgileSettingsView()
}
