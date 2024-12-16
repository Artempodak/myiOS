

import SwiftUI

struct ChatView: View {
    
    
    @StateObject private var viewModel = ChatViewModel()
    @State private var isPhotoPickerPresented = false
    @State private var isCameraPresented = false
    @State private var showActionSheet = false 

    var body: some View {
        
        ZStack{
            LinearGradient(colors: [.gray, .bg], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(groupedMessages().sorted(by: { $0.key < $1.key }), id: \.key) { date, messages in
                            VStack(spacing: 8) {
                                Text(formatDate(date))
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .padding(.horizontal,4)
                                    .background(Color.white.opacity(0.2))
                                    .clipShape(Capsule())
                                
                                ForEach(messages) { message in
                                    MessageView(message: message)
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                Divider()
                
                VStack(spacing: 8) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.selectedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                    
                    HStack {
                        
                        Button(action: {
                            showActionSheet = true // Показываем меню выбора
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.accent)
                        }
                        

                        
                        TextField("Введите сообщение...", text: $viewModel.currentText)
                            .padding(7)
                            .lineLimit(1 ... 5)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Capsule())
                        
                        Button(action: {
                            viewModel.sendMessage()
                        }) {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(viewModel.currentText.isEmpty && viewModel.selectedImages.isEmpty ? .darkaccent.opacity(0.6) : .accent )
                        }
                        .disabled(viewModel.currentText.isEmpty && viewModel.selectedImages.isEmpty)
                    }
                    
                }
                .padding()
                .background(Color.bg)
            }
            .sheet(isPresented: $isPhotoPickerPresented) {
                PhotoPicker(images: $viewModel.selectedImages, maxSelection: 4)
            }
            .sheet(isPresented: $isCameraPresented) {
                CameraPicker(image: Binding(
                    get: {
                        viewModel.selectedImages.first // Используем первый элемент из массива
                    },
                    set: { newImage in
                        if let newImage = newImage {
                            viewModel.selectedImages.append(newImage) // Добавляем снимок в массив
                        }
                    }
                ))
            }
            .confirmationDialog("Выберите источник", isPresented: $showActionSheet) {
                Button("Снять фото")
                {
                    isCameraPresented = true
                }
                Button("Выбрать из галереи") {
                    isPhotoPickerPresented = true
                }
                Button("Отмена", role: .cancel) {}
            }
        }
    }

    private func groupedMessages() -> [Date: [Message]] {
        Dictionary(grouping: viewModel.messages, by: { Calendar.current.startOfDay(for: $0.timestamp) })
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ChatView()
}
