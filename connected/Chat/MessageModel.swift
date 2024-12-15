//
//  MessageModel.swift
//  connected
//
//  Created by Artem Podorozhniy on 14.12.2024.
//


import Foundation
import UIKit

struct Message: Identifiable {
    let id: UUID
    let text: String // Текст сообщения
    let timestamp: Date // Время отправки
    let images: [UIImage] // Список фотографий
}
