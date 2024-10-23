//
//  TopicsData.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import Foundation

struct TopicsData {
    var topics: [Topic]
    private let persistenceManager = PersistenceManager.shared
    
    init() {
        self.topics = []
        if persistenceManager.hasDataBeenLoaded() {
            topics = persistenceManager.loadTopicsArray() ?? []
            
            print("Loaded data since it was already saved.")
        } else {
            forceSavingData()
        }
        
    }
    
    mutating func forceSavingData() {
        topics = [
            Topic(title: "Basic", emoji: "⭐️", isShortLessonCompleted: false, lessonDescription: "Start with the basics! In Spanish, 'Hola' means 'Hello,' and 'Adiós' means 'Goodbye.'",
                  lessons: [
                      Lesson(phraseInEnglish: "Hello", phraseInSpanish: "Hola"),
                      Lesson(phraseInEnglish: "Goodbye", phraseInSpanish: "Adiós"),
                      Lesson(phraseInEnglish: "Yes", phraseInSpanish: "Sí"),
                      Lesson(phraseInEnglish: "No", phraseInSpanish: "No")
                  ]),
            
            Topic(title: "Common Phrases", emoji: "🗣️", isShortLessonCompleted: false, lessonDescription: "In this lesson, you'll learn key phrases like 'Cómo estás?' (How are you?) and 'Mucho gusto' (Nice to meet you).",
                  lessons: [
                      Lesson(phraseInEnglish: "How are you?", phraseInSpanish: "¿Cómo estás?"),
                      Lesson(phraseInEnglish: "Nice to meet you", phraseInSpanish: "Mucho gusto"),
                      Lesson(phraseInEnglish: "Thank you", phraseInSpanish: "Gracias"),
                      Lesson(phraseInEnglish: "Please", phraseInSpanish: "Por favor")
                  ]),
            
            Topic(title: "Numbers", emoji: "1️⃣", isShortLessonCompleted: false, lessonDescription: "Learn the basics of counting in Spanish.",
                  lessons: [
                      Lesson(phraseInEnglish: "One", phraseInSpanish: "Uno"),
                      Lesson(phraseInEnglish: "Two", phraseInSpanish: "Dos"),
                      Lesson(phraseInEnglish: "Three", phraseInSpanish: "Tres"),
                      Lesson(phraseInEnglish: "Four", phraseInSpanish: "Cuatro"),
                      Lesson(phraseInEnglish: "Five", phraseInSpanish: "Cinco")
                  ]),
            
            Topic(title: "Greetings", emoji: "👋", isShortLessonCompleted: false, lessonDescription: "Spanish greetings vary by formality.",
                  lessons: [
                      Lesson(phraseInEnglish: "Hi", phraseInSpanish: "Hola"),
                      Lesson(phraseInEnglish: "Good morning", phraseInSpanish: "Buenos días"),
                      Lesson(phraseInEnglish: "Good evening", phraseInSpanish: "Buenas noches"),
                      Lesson(phraseInEnglish: "Good afternoon", phraseInSpanish: "Buenas tardes")
                  ]),
            
            Topic(title: "Colors", emoji: "🎨", isShortLessonCompleted: false, lessonDescription: "Learn how to describe the world in color.",
                  lessons: [
                      Lesson(phraseInEnglish: "Red", phraseInSpanish: "Rojo"),
                      Lesson(phraseInEnglish: "Blue", phraseInSpanish: "Azul"),
                      Lesson(phraseInEnglish: "Green", phraseInSpanish: "Verde"),
                      Lesson(phraseInEnglish: "Yellow", phraseInSpanish: "Amarillo")
                  ]),
            
            Topic(title: "Family", emoji: "👨‍👩‍👧", isShortLessonCompleted: false, lessonDescription: "Talking about family is common in any language.",
                  lessons: [
                      Lesson(phraseInEnglish: "Mother", phraseInSpanish: "Madre"),
                      Lesson(phraseInEnglish: "Father", phraseInSpanish: "Padre"),
                      Lesson(phraseInEnglish: "Brother", phraseInSpanish: "Hermano"),
                      Lesson(phraseInEnglish: "Sister", phraseInSpanish: "Hermana")
                  ]),
            
            Topic(title: "Food & Drink", emoji: "🍎", isShortLessonCompleted: false, lessonDescription: "Learn common words like 'Comida' (Food), 'Agua' (Water), and 'Pan' (Bread).",
                  lessons: [
                      Lesson(phraseInEnglish: "Food", phraseInSpanish: "Comida"),
                      Lesson(phraseInEnglish: "Water", phraseInSpanish: "Agua"),
                      Lesson(phraseInEnglish: "Bread", phraseInSpanish: "Pan"),
                      Lesson(phraseInEnglish: "Fruit", phraseInSpanish: "Fruta")
                  ]),
            
            Topic(title: "Travel", emoji: "✈️", isShortLessonCompleted: false, lessonDescription: "Traveling in Spanish-speaking countries? Learn key phrases.",
                  lessons: [
                      Lesson(phraseInEnglish: "Where is the bathroom?", phraseInSpanish: "¿Dónde está el baño?"),
                      Lesson(phraseInEnglish: "I would like a reservation", phraseInSpanish: "Quisiera una reserva"),
                      Lesson(phraseInEnglish: "Help!", phraseInSpanish: "¡Ayuda!"),
                      Lesson(phraseInEnglish: "How much is this?", phraseInSpanish: "¿Cuánto cuesta esto?")
                  ]),
            
            Topic(title: "Time & Dates", emoji: "⏰", isShortLessonCompleted: false, lessonDescription: "Learn to tell time in Spanish.",
                  lessons: [
                      Lesson(phraseInEnglish: "What time is it?", phraseInSpanish: "¿Qué hora es?"),
                      Lesson(phraseInEnglish: "It's one o'clock", phraseInSpanish: "Es la una"),
                      Lesson(phraseInEnglish: "It's two o'clock", phraseInSpanish: "Son las dos"),
                      Lesson(phraseInEnglish: "Today is Monday", phraseInSpanish: "Hoy es lunes")
                  ]),
            
            Topic(title: "Shopping", emoji: "🛒", isShortLessonCompleted: false, lessonDescription: "Shopping in Spanish is easy with key phrases.",
                  lessons: [
                      Lesson(phraseInEnglish: "How much does it cost?", phraseInSpanish: "¿Cuánto cuesta?"),
                      Lesson(phraseInEnglish: "I like it", phraseInSpanish: "Me gusta"),
                      Lesson(phraseInEnglish: "I want to buy this", phraseInSpanish: "Quiero comprar esto"),
                      Lesson(phraseInEnglish: "Do you have this in another size?", phraseInSpanish: "¿Tienes esto en otra talla?")
                  ]),
            
            Topic(title: "Directions", emoji: "🧭", isShortLessonCompleted: false, lessonDescription: "Learn to ask for directions.",
                  lessons: [
                      Lesson(phraseInEnglish: "Where is...?", phraseInSpanish: "¿Dónde está...?"),
                      Lesson(phraseInEnglish: "Is it far?", phraseInSpanish: "¿Está lejos?"),
                      Lesson(phraseInEnglish: "Turn left", phraseInSpanish: "Gira a la izquierda"),
                      Lesson(phraseInEnglish: "Turn right", phraseInSpanish: "Gira a la derecha")
                  ]),
            
            Topic(title: "Weather", emoji: "☀️", isShortLessonCompleted: false, lessonDescription: "Talking about the weather is a great conversation starter.",
                  lessons: [
                      Lesson(phraseInEnglish: "It's hot", phraseInSpanish: "Hace calor"),
                      Lesson(phraseInEnglish: "It's raining", phraseInSpanish: "Está lloviendo"),
                      Lesson(phraseInEnglish: "It's cold", phraseInSpanish: "Hace frío"),
                      Lesson(phraseInEnglish: "It's sunny", phraseInSpanish: "Está soleado")
                  ]),
            
            Topic(title: "Occupations", emoji: "💼", isShortLessonCompleted: false, lessonDescription: "Learn job-related vocabulary.",
                  lessons: [
                      Lesson(phraseInEnglish: "Doctor", phraseInSpanish: "Médico"),
                      Lesson(phraseInEnglish: "Teacher", phraseInSpanish: "Profesor"),
                      Lesson(phraseInEnglish: "Engineer", phraseInSpanish: "Ingeniero"),
                      Lesson(phraseInEnglish: "Nurse", phraseInSpanish: "Enfermera")
                  ]),
            
            Topic(title: "Clothing", emoji: "👗", isShortLessonCompleted: false, lessonDescription: "Learn how to talk about clothing in Spanish.",
                  lessons: [
                      Lesson(phraseInEnglish: "Shirt", phraseInSpanish: "Camisa"),
                      Lesson(phraseInEnglish: "Pants", phraseInSpanish: "Pantalones"),
                      Lesson(phraseInEnglish: "Shoes", phraseInSpanish: "Zapatos"),
                      Lesson(phraseInEnglish: "Dress", phraseInSpanish: "Vestido")
                  ]),
            
            Topic(title: "Animals", emoji: "🐶", isShortLessonCompleted: false, lessonDescription: "Learn the names of common animals.",
                  lessons: [
                      Lesson(phraseInEnglish: "Dog", phraseInSpanish: "Perro"),
                      Lesson(phraseInEnglish: "Cat", phraseInSpanish: "Gato"),
                      Lesson(phraseInEnglish: "Bird", phraseInSpanish: "Pájaro"),
                      Lesson(phraseInEnglish: "Fish", phraseInSpanish: "Pez")
                  ]),
            
            Topic(title: "Health", emoji: "💊", isShortLessonCompleted: false, lessonDescription: "Discuss health and wellness in Spanish.",
                  lessons: [
                      Lesson(phraseInEnglish: "I am sick", phraseInSpanish: "Estoy enfermo/a"),
                      Lesson(phraseInEnglish: "I need a doctor", phraseInSpanish: "Necesito un médico"),
                      Lesson(phraseInEnglish: "Medicine", phraseInSpanish: "Medicamento"),
                      Lesson(phraseInEnglish: "Pain", phraseInSpanish: "Dolor")
                  ]),
            
            Topic(title: "Hobbies", emoji: "🎸", isShortLessonCompleted: false, lessonDescription: "Share your interests with others.",
                  lessons: [
                      Lesson(phraseInEnglish: "I like reading", phraseInSpanish: "Me gusta leer"),
                      Lesson(phraseInEnglish: "I enjoy cooking", phraseInSpanish: "Me gusta cocinar"),
                      Lesson(phraseInEnglish: "I love music", phraseInSpanish: "Me encanta la música"),
                      Lesson(phraseInEnglish: "I like sports", phraseInSpanish: "Me gustan los deportes")
                  ])
        ]

        persistenceManager.saveTopicsArray(topics)
        persistenceManager.setHasDataBeenLoaded()
        
        print("Created data and saved it since it had not been saved.")
    }
}
