import SwiftUI

struct CardView: View {
    let card: FlashCard
    let isShowingAnswer: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            if !isShowingAnswer {
                // Показываем английское слово
                VStack(spacing: 15) {
                    Text(card.english)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    if !card.transcription.isEmpty {
                        Text(card.transcription)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    
                    if !card.example.isEmpty {
                        Text(card.example)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
            } else {
                // Показываем перевод
                VStack(spacing: 15) {
                    Text(card.russian)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(card.english)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    if !card.transcription.isEmpty {
                        Text(card.transcription)
                            .font(.title3)
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    
                    if !card.example.isEmpty {
                        VStack(spacing: 8) {
                            Text(card.example)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            if !card.exampleTranslation.isEmpty {
                                Text(card.exampleTranslation)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .italic()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.blue.opacity(0.1),
                            Color.purple.opacity(0.1)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(radius: 10, x: 0, y: 5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.3), lineWidth: 2)
        )
    }
}