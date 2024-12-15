//
//  CameraPicker.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//

import Foundation
import SwiftUI



struct CameraPicker: UIViewControllerRepresentable {
    @Binding var image: UIImage? // Для хранения выбранного изображения
    @Environment(\.presentationMode) var presentationMode // Для закрытия камеры

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera // Указываем, что источник — камера
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraPicker

        init(parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.image = selectedImage // Сохраняем выбранное изображение
            }
            parent.presentationMode.wrappedValue.dismiss() // Закрываем камеру
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss() // Закрываем камеру при отмене
        }
    }
}
