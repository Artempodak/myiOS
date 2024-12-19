import SwiftUI

struct MessageView: View {
    let message: Message

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                
                // Проверка для текстового сообщения
                if let text = message.text, !text.isEmpty {
                    Text(text)
                }
                
                // Проверка для изображений
                if let images = message.images, !images.isEmpty {
                    HStack {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 210, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                
                // Отображение времени
                Text(formatTimestamp(message.timestamp))
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                
            }
            .padding()
            .background(Color.white.opacity(0.4))
            .cornerRadius(8)
        }
    }

    private func formatTimestamp(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
