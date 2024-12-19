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
    let text: String? // Текст сообщения
    var audioURL: URL?// URL для голосового сообщения (если есть)
    let timestamp: Date // Время отправки
    let images: [UIImage]? // Список фотографий
}
