//
//  PhotoPicker.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//


import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    let maxSelection: Int
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = maxSelection
        config.filter = .images // Фильтруем только изображения
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Закрываем представление выбора фотографий
            picker.dismiss(animated: true)
            
            guard !results.isEmpty else {
                return // Если ничего не выбрано, просто выходим
            }
            
            for result in results {
                // Проверяем, может ли изображение быть загружено
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
                        if let error = error {
                            print("Ошибка загрузки изображения: \(error.localizedDescription)")
                            return
                        }
                        
                        guard let image = object as? UIImage else {
                            print("Ошибка: объект не является UIImage")
                            return
                        }
                        
                        DispatchQueue.main.async {
                            // Добавляем изображение в массив
                            self?.parent.images.append(image)
                        }
                    }
                }
            }
        }
    }
}
