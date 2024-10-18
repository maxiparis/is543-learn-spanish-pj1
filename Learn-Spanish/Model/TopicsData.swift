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
                      Topic.Lesson(phraseInEnglish: "Hello", phraseInSpanish: "Hola"),
                      Topic.Lesson(phraseInEnglish: "Goodbye", phraseInSpanish: "Adiós"),
                      Topic.Lesson(phraseInEnglish: "Yes", phraseInSpanish: "Sí"),
                      Topic.Lesson(phraseInEnglish: "No", phraseInSpanish: "No")
                  ]),
            
            Topic(title: "Common Phrases", emoji: "🗣️", isShortLessonCompleted: false, lessonDescription: "In this lesson, you'll learn key phrases like 'Cómo estás?' (How are you?) and 'Mucho gusto' (Nice to meet you).",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "How are you?", phraseInSpanish: "¿Cómo estás?"),
                      Topic.Lesson(phraseInEnglish: "Nice to meet you", phraseInSpanish: "Mucho gusto"),
                      Topic.Lesson(phraseInEnglish: "Thank you", phraseInSpanish: "Gracias"),
                      Topic.Lesson(phraseInEnglish: "Please", phraseInSpanish: "Por favor")
                  ]),
            
            Topic(title: "Numbers", emoji: "1️⃣", isShortLessonCompleted: false, lessonDescription: "Learn the basics of counting in Spanish.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "One", phraseInSpanish: "Uno"),
                      Topic.Lesson(phraseInEnglish: "Two", phraseInSpanish: "Dos"),
                      Topic.Lesson(phraseInEnglish: "Three", phraseInSpanish: "Tres"),
                      Topic.Lesson(phraseInEnglish: "Four", phraseInSpanish: "Cuatro"),
                      Topic.Lesson(phraseInEnglish: "Five", phraseInSpanish: "Cinco")
                  ]),
            
            Topic(title: "Greetings", emoji: "👋", isShortLessonCompleted: false, lessonDescription: "Spanish greetings vary by formality.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Hi", phraseInSpanish: "Hola"),
                      Topic.Lesson(phraseInEnglish: "Good morning", phraseInSpanish: "Buenos días"),
                      Topic.Lesson(phraseInEnglish: "Good evening", phraseInSpanish: "Buenas noches"),
                      Topic.Lesson(phraseInEnglish: "Good afternoon", phraseInSpanish: "Buenas tardes")
                  ]),
            
            Topic(title: "Colors", emoji: "🎨", isShortLessonCompleted: false, lessonDescription: "Learn how to describe the world in color.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Red", phraseInSpanish: "Rojo"),
                      Topic.Lesson(phraseInEnglish: "Blue", phraseInSpanish: "Azul"),
                      Topic.Lesson(phraseInEnglish: "Green", phraseInSpanish: "Verde"),
                      Topic.Lesson(phraseInEnglish: "Yellow", phraseInSpanish: "Amarillo")
                  ]),
            
            Topic(title: "Family", emoji: "👨‍👩‍👧", isShortLessonCompleted: false, lessonDescription: "Talking about family is common in any language.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Mother", phraseInSpanish: "Madre"),
                      Topic.Lesson(phraseInEnglish: "Father", phraseInSpanish: "Padre"),
                      Topic.Lesson(phraseInEnglish: "Brother", phraseInSpanish: "Hermano"),
                      Topic.Lesson(phraseInEnglish: "Sister", phraseInSpanish: "Hermana")
                  ]),
            
            Topic(title: "Food & Drink", emoji: "🍎", isShortLessonCompleted: false, lessonDescription: "Learn common words like 'Comida' (Food), 'Agua' (Water), and 'Pan' (Bread).",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Food", phraseInSpanish: "Comida"),
                      Topic.Lesson(phraseInEnglish: "Water", phraseInSpanish: "Agua"),
                      Topic.Lesson(phraseInEnglish: "Bread", phraseInSpanish: "Pan"),
                      Topic.Lesson(phraseInEnglish: "Fruit", phraseInSpanish: "Fruta")
                  ]),
            
            Topic(title: "Travel", emoji: "✈️", isShortLessonCompleted: false, lessonDescription: "Traveling in Spanish-speaking countries? Learn key phrases.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Where is the bathroom?", phraseInSpanish: "¿Dónde está el baño?"),
                      Topic.Lesson(phraseInEnglish: "I would like a reservation", phraseInSpanish: "Quisiera una reserva"),
                      Topic.Lesson(phraseInEnglish: "Help!", phraseInSpanish: "¡Ayuda!"),
                      Topic.Lesson(phraseInEnglish: "How much is this?", phraseInSpanish: "¿Cuánto cuesta esto?")
                  ]),
            
            Topic(title: "Time & Dates", emoji: "⏰", isShortLessonCompleted: false, lessonDescription: "Learn to tell time in Spanish.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "What time is it?", phraseInSpanish: "¿Qué hora es?"),
                      Topic.Lesson(phraseInEnglish: "It's one o'clock", phraseInSpanish: "Es la una"),
                      Topic.Lesson(phraseInEnglish: "It's two o'clock", phraseInSpanish: "Son las dos"),
                      Topic.Lesson(phraseInEnglish: "Today is Monday", phraseInSpanish: "Hoy es lunes")
                  ]),
            
            Topic(title: "Shopping", emoji: "🛒", isShortLessonCompleted: false, lessonDescription: "Shopping in Spanish is easy with key phrases.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "How much does it cost?", phraseInSpanish: "¿Cuánto cuesta?"),
                      Topic.Lesson(phraseInEnglish: "I like it", phraseInSpanish: "Me gusta"),
                      Topic.Lesson(phraseInEnglish: "I want to buy this", phraseInSpanish: "Quiero comprar esto"),
                      Topic.Lesson(phraseInEnglish: "Do you have this in another size?", phraseInSpanish: "¿Tienes esto en otra talla?")
                  ]),
            
            Topic(title: "Directions", emoji: "🧭", isShortLessonCompleted: false, lessonDescription: "Learn to ask for directions.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Where is...?", phraseInSpanish: "¿Dónde está...?"),
                      Topic.Lesson(phraseInEnglish: "Is it far?", phraseInSpanish: "¿Está lejos?"),
                      Topic.Lesson(phraseInEnglish: "Turn left", phraseInSpanish: "Gira a la izquierda"),
                      Topic.Lesson(phraseInEnglish: "Turn right", phraseInSpanish: "Gira a la derecha")
                  ]),
            
            Topic(title: "Weather", emoji: "☀️", isShortLessonCompleted: false, lessonDescription: "Talking about the weather is a great conversation starter.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "It's hot", phraseInSpanish: "Hace calor"),
                      Topic.Lesson(phraseInEnglish: "It's raining", phraseInSpanish: "Está lloviendo"),
                      Topic.Lesson(phraseInEnglish: "It's cold", phraseInSpanish: "Hace frío"),
                      Topic.Lesson(phraseInEnglish: "It's sunny", phraseInSpanish: "Está soleado")
                  ]),
            
            Topic(title: "Occupations", emoji: "💼", isShortLessonCompleted: false, lessonDescription: "Learn job-related vocabulary.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Doctor", phraseInSpanish: "Médico"),
                      Topic.Lesson(phraseInEnglish: "Teacher", phraseInSpanish: "Profesor"),
                      Topic.Lesson(phraseInEnglish: "Engineer", phraseInSpanish: "Ingeniero"),
                      Topic.Lesson(phraseInEnglish: "Nurse", phraseInSpanish: "Enfermera")
                  ]),
            
            Topic(title: "Clothing", emoji: "👗", isShortLessonCompleted: false, lessonDescription: "Learn how to talk about clothing in Spanish.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Shirt", phraseInSpanish: "Camisa"),
                      Topic.Lesson(phraseInEnglish: "Pants", phraseInSpanish: "Pantalones"),
                      Topic.Lesson(phraseInEnglish: "Shoes", phraseInSpanish: "Zapatos"),
                      Topic.Lesson(phraseInEnglish: "Dress", phraseInSpanish: "Vestido")
                  ]),
            
            Topic(title: "Animals", emoji: "🐶", isShortLessonCompleted: false, lessonDescription: "Learn the names of common animals.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "Dog", phraseInSpanish: "Perro"),
                      Topic.Lesson(phraseInEnglish: "Cat", phraseInSpanish: "Gato"),
                      Topic.Lesson(phraseInEnglish: "Bird", phraseInSpanish: "Pájaro"),
                      Topic.Lesson(phraseInEnglish: "Fish", phraseInSpanish: "Pez")
                  ]),
            
            Topic(title: "Health", emoji: "💊", isShortLessonCompleted: false, lessonDescription: "Discuss health and wellness in Spanish.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "I am sick", phraseInSpanish: "Estoy enfermo/a"),
                      Topic.Lesson(phraseInEnglish: "I need a doctor", phraseInSpanish: "Necesito un médico"),
                      Topic.Lesson(phraseInEnglish: "Medicine", phraseInSpanish: "Medicamento"),
                      Topic.Lesson(phraseInEnglish: "Pain", phraseInSpanish: "Dolor")
                  ]),
            
            Topic(title: "Hobbies", emoji: "🎸", isShortLessonCompleted: false, lessonDescription: "Share your interests with others.",
                  lessons: [
                      Topic.Lesson(phraseInEnglish: "I like reading", phraseInSpanish: "Me gusta leer"),
                      Topic.Lesson(phraseInEnglish: "I enjoy cooking", phraseInSpanish: "Me gusta cocinar"),
                      Topic.Lesson(phraseInEnglish: "I love music", phraseInSpanish: "Me encanta la música"),
                      Topic.Lesson(phraseInEnglish: "I like sports", phraseInSpanish: "Me gustan los deportes")
                  ])
        ]

        persistenceManager.saveTopicsArray(topics)
        persistenceManager.setHasDataBeenLoaded()
        
        print("Created data and saved it since it had not been saved.")
    }
}
