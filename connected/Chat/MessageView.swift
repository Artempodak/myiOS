import SwiftUI

struct MessageView: View {
    let message: Message

    var body: some View {
        
        HStack{
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                
                if !message.text.isEmpty {
                    Text(message.text)
                }
                
                if !message.images.isEmpty {
                        HStack {
                            ForEach(message.images, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 210, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                }
                
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
