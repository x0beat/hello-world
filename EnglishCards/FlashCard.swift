import Foundation

struct FlashCard: Identifiable, Codable {
    let id = UUID()
    let english: String
    let russian: String
    let transcription: String
    let example: String
    let exampleTranslation: String
    
    init(english: String, russian: String, transcription: String = "", example: String = "", exampleTranslation: String = "") {
        self.english = english
        self.russian = russian
        self.transcription = transcription
        self.example = example
        self.exampleTranslation = exampleTranslation
    }
}