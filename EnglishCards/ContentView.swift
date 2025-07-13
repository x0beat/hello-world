import SwiftUI

struct ContentView: View {
    @StateObject private var wordsData = WordsData()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Прогресс бар
                VStack {
                    HStack {
                        Text("Карточка \(wordsData.currentIndex + 1) из \(wordsData.cards.count)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    
                    ProgressView(value: Double(wordsData.currentIndex + 1), total: Double(wordsData.cards.count))
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                }
                .padding(.horizontal)
                
                // Карточка
                if wordsData.cards.indices.contains(wordsData.currentIndex) {
                    CardView(
                        card: wordsData.cards[wordsData.currentIndex],
                        isShowingAnswer: wordsData.showingAnswer
                    )
                    .frame(height: 400)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            wordsData.toggleAnswer()
                        }
                    }
                }
                
                // Кнопки управления
                HStack(spacing: 20) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            wordsData.previousCard()
                        }
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .disabled(wordsData.cards.isEmpty)
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            wordsData.toggleAnswer()
                        }
                    }) {
                        Text(wordsData.showingAnswer ? "Скрыть" : "Показать")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.blue)
                            )
                    }
                    .disabled(wordsData.cards.isEmpty)
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            wordsData.nextCard()
                        }
                    }) {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .disabled(wordsData.cards.isEmpty)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("English Cards")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            wordsData.shuffle()
                        }
                    }) {
                        Image(systemName: "shuffle")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}