//
//  ChatViewModel.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//



import SwiftUI

class ChatViewModel: ObservableObject {
    
    
    @Published var messages: [Message] = [] // Список всех сообщений
    @Published var currentText: String = "" // Текущий текст сообщения
    @Published var selectedImages: [UIImage] = [] // Выбранные изображения

    // Отправка голосового сообщения
    func sendVoiceMessage(audioURL: URL) {
        let message = Message(
            id: UUID(),
            text: nil, // Для голосового сообщения текст пустой
            audioURL: audioURL, // Добавляем URL голосового сообщения
            timestamp: Date(),
            images: nil
        )
        messages.append(message)
    }

    
    
    func sendMessage() {
        let timestamp = Date()

        // Если есть текст, отправляем его как сообщение
        if !currentText.isEmpty {
            let newMessage = Message(id: UUID(), text: currentText, timestamp: timestamp, images: [])
            messages.append(newMessage)
            currentText = "" // Сбрасываем текстовое поле
        }

        // Если есть выбранные изображения, отправляем их как сообщение
        if !selectedImages.isEmpty {
            let imageMessages = selectedImages.map { image in
                Message(id: UUID(), text: "", timestamp: timestamp, images: [image])
            }
            messages.append(contentsOf: imageMessages)
            selectedImages.removeAll() // Очищаем выбранные изображения
        }
    }
}
