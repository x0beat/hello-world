import Foundation

class WordsData: ObservableObject {
    @Published var cards: [FlashCard] = [
        FlashCard(
            english: "Hello",
            russian: "Привет",
            transcription: "/həˈloʊ/",
            example: "Hello, how are you?",
            exampleTranslation: "Привет, как дела?"
        ),
        FlashCard(
            english: "World",
            russian: "Мир",
            transcription: "/wɜːrld/",
            example: "The world is beautiful",
            exampleTranslation: "Мир прекрасен"
        ),
        FlashCard(
            english: "Study",
            russian: "Изучать",
            transcription: "/ˈstʌdi/",
            example: "I study English every day",
            exampleTranslation: "Я изучаю английский каждый день"
        ),
        FlashCard(
            english: "Language",
            russian: "Язык",
            transcription: "/ˈlæŋɡwɪdʒ/",
            example: "English is a beautiful language",
            exampleTranslation: "Английский - красивый язык"
        ),
        FlashCard(
            english: "Learn",
            russian: "Учить",
            transcription: "/lɜːrn/",
            example: "I want to learn new words",
            exampleTranslation: "Я хочу изучать новые слова"
        ),
        FlashCard(
            english: "Book",
            russian: "Книга",
            transcription: "/bʊk/",
            example: "I read a good book",
            exampleTranslation: "Я читаю хорошую книгу"
        ),
        FlashCard(
            english: "Time",
            russian: "Время",
            transcription: "/taɪm/",
            example: "What time is it?",
            exampleTranslation: "Сколько времени?"
        ),
        FlashCard(
            english: "Friend",
            russian: "Друг",
            transcription: "/frend/",
            example: "My friend is very kind",
            exampleTranslation: "Мой друг очень добрый"
        ),
        FlashCard(
            english: "House",
            russian: "Дом",
            transcription: "/haʊs/",
            example: "I live in a big house",
            exampleTranslation: "Я живу в большом доме"
        ),
        FlashCard(
            english: "Water",
            russian: "Вода",
            transcription: "/ˈwɔːtər/",
            example: "I drink water every day",
            exampleTranslation: "Я пью воду каждый день"
        ),
        FlashCard(
            english: "Food",
            russian: "Еда",
            transcription: "/fuːd/",
            example: "This food is delicious",
            exampleTranslation: "Эта еда вкусная"
        ),
        FlashCard(
            english: "Family",
            russian: "Семья",
            transcription: "/ˈfæməli/",
            example: "I love my family",
            exampleTranslation: "Я люблю свою семью"
        ),
        FlashCard(
            english: "School",
            russian: "Школа",
            transcription: "/skuːl/",
            example: "I go to school every day",
            exampleTranslation: "Я хожу в школу каждый день"
        ),
        FlashCard(
            english: "Work",
            russian: "Работа",
            transcription: "/wɜːrk/",
            example: "I work in an office",
            exampleTranslation: "Я работаю в офисе"
        ),
        FlashCard(
            english: "Happy",
            russian: "Счастливый",
            transcription: "/ˈhæpi/",
            example: "I am happy today",
            exampleTranslation: "Я счастлив сегодня"
        ),
        FlashCard(
            english: "Love",
            russian: "Любовь",
            transcription: "/lʌv/",
            example: "Love is everywhere",
            exampleTranslation: "Любовь повсюду"
        ),
        FlashCard(
            english: "Beautiful",
            russian: "Красивый",
            transcription: "/ˈbjuːtɪfəl/",
            example: "The sunset is beautiful",
            exampleTranslation: "Закат красивый"
        ),
        FlashCard(
            english: "Travel",
            russian: "Путешествовать",
            transcription: "/ˈtrævəl/",
            example: "I love to travel",
            exampleTranslation: "Я люблю путешествовать"
        ),
        FlashCard(
            english: "Music",
            russian: "Музыка",
            transcription: "/ˈmjuːzɪk/",
            example: "I listen to music",
            exampleTranslation: "Я слушаю музыку"
        ),
        FlashCard(
            english: "Dream",
            russian: "Мечта",
            transcription: "/driːm/",
            example: "My dream is to speak English fluently",
            exampleTranslation: "Моя мечта - свободно говорить по-английски"
        )
    ]
    
    @Published var currentIndex = 0
    @Published var showingAnswer = false
    
    func nextCard() {
        showingAnswer = false
        if currentIndex < cards.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }
    
    func previousCard() {
        showingAnswer = false
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            currentIndex = cards.count - 1
        }
    }
    
    func toggleAnswer() {
        showingAnswer.toggle()
    }
    
    func shuffle() {
        cards.shuffle()
        currentIndex = 0
        showingAnswer = false
    }
}