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
        if persistenceManager.hasDataBeenLoaded() {
            topics = persistenceManager.loadTopicsArray() ?? []
            print("Loaded data since it was already saved.")
        } else {
            topics = [
                Topic(title: "Basic", emoji: "⭐️", isCompleted: false, lessonDescription: "Start with the basics! In Spanish, 'Hola' means 'Hello,' and 'Adiós' means 'Goodbye.' You'll also learn to say 'Yes' (Sí) and 'No' (No). These words will help you in almost any situation when you're just starting out."),
                
                Topic(title: "Common Phrases", emoji: "🗣️", isCompleted: false, lessonDescription: "In this lesson, you'll learn key phrases like 'Cómo estás?' (How are you?) and 'Mucho gusto' (Nice to meet you). These phrases will help you greet people and engage in simple conversations."),
                
                Topic(title: "Numbers", emoji: "1️⃣", isCompleted: false, lessonDescription: "Learn the basics of counting in Spanish. 'Uno' (1), 'Dos' (2), 'Tres' (3), and so on. Being able to count is essential when talking about prices, quantities, or dates."),
                
                Topic(title: "Greetings", emoji: "👋", isCompleted: false, lessonDescription: "Spanish greetings vary by formality. For example, you might say 'Hola' (Hi) to a friend and 'Buenos días' (Good morning) to someone more formally. This lesson will guide you through both casual and formal greetings."),
                
                Topic(title: "Colors", emoji: "🎨", isCompleted: false, lessonDescription: "Learn how to describe the world in color. 'Rojo' (Red), 'Azul' (Blue), and 'Verde' (Green) are some of the basics. Knowing colors helps when shopping or describing objects around you."),
                
                Topic(title: "Family", emoji: "👨‍👩‍👧", isCompleted: false, lessonDescription: "Talking about family is common in any language. Learn words like 'Madre' (Mother), 'Padre' (Father), 'Hermano' (Brother), and 'Hermana' (Sister) to describe family relationships."),
                
                Topic(title: "Food & Drink", emoji: "🍎", isCompleted: false, lessonDescription: "Hungry? In this lesson, learn common words like 'Comida' (Food), 'Agua' (Water), and 'Pan' (Bread). You'll be able to order basic meals and snacks while traveling."),
                
                Topic(title: "Travel", emoji: "✈️", isCompleted: false, lessonDescription: "Traveling in Spanish-speaking countries? Learn key phrases like '¿Dónde está el baño?' (Where is the bathroom?) and 'Quisiera una reserva' (I would like to make a reservation) for smooth traveling."),
                
                Topic(title: "Time & Dates", emoji: "⏰", isCompleted: false, lessonDescription: "Learn to tell time in Spanish. '¿Qué hora es?' (What time is it?), and responses like 'Es la una' (It’s one o’clock) or 'Son las dos' (It’s two o’clock). This will help you schedule and plan activities."),
                
                Topic(title: "Shopping", emoji: "🛒", isCompleted: false, lessonDescription: "Shopping in Spanish is easy with words like '¿Cuánto cuesta?' (How much does it cost?) and 'Me gusta' (I like it). You’ll be ready to shop for clothes, food, and more."),
                
                Topic(title: "Directions", emoji: "🧭", isCompleted: false, lessonDescription: "Learn to ask for directions with phrases like '¿Dónde está...?' (Where is...?). For example, '¿Dónde está la estación?' (Where is the station?) helps when navigating unfamiliar places."),
                
                Topic(title: "Weather", emoji: "☀️", isCompleted: false, lessonDescription: "Talking about the weather is a great conversation starter. Learn phrases like 'Hace calor' (It’s hot) or 'Está lloviendo' (It’s raining) to describe weather conditions."),
                
                Topic(title: "Occupations", emoji: "💼", isCompleted: false, lessonDescription: "Learn job-related vocabulary like 'Médico' (Doctor), 'Profesor' (Teacher), and 'Ingeniero' (Engineer). Knowing occupations is helpful in everyday conversations."),
                
                Topic(title: "Clothing", emoji: "👗", isCompleted: false, lessonDescription: "Learn how to talk about clothing in Spanish. Words like 'Camisa' (Shirt), 'Pantalones' (Pants), and 'Zapatos' (Shoes) will help you when shopping or describing outfits."),
                
                Topic(title: "Animals", emoji: "🐶", isCompleted: false, lessonDescription: "Learn the names of common animals like 'Perro' (Dog), 'Gato' (Cat), and 'Pájaro' (Bird). This lesson will help you talk about pets and wildlife."),
                
                Topic(title: "Health", emoji: "💊", isCompleted: false, lessonDescription: "In this lesson, you'll learn important words like 'Enfermo' (Sick), 'Doctor' (Doctor), and 'Hospital' (Hospital). These are useful when talking about health and medical issues."),
                
                Topic(title: "Emotions", emoji: "😊", isCompleted: false, lessonDescription: "Learn how to express emotions like 'Feliz' (Happy), 'Triste' (Sad), and 'Enojado' (Angry). Describing your feelings is essential for personal conversations."),
                
                Topic(title: "Hobbies", emoji: "🎸", isCompleted: false, lessonDescription: "Learn to talk about your hobbies in Spanish. Words like 'Leer' (Reading), 'Cantar' (Singing), and 'Correr' (Running) will help you share your favorite pastimes."),
                
                Topic(title: "Sports", emoji: "⚽️", isCompleted: false, lessonDescription: "Sports are a big part of many cultures. Learn words like 'Fútbol' (Soccer), 'Béisbol' (Baseball), and 'Baloncesto' (Basketball) to discuss your favorite sports."),
                
                Topic(title: "Technology", emoji: "💻", isCompleted: false, lessonDescription: "Talk about technology with words like 'Teléfono' (Phone), 'Computadora' (Computer), and 'Internet.' These are essential in today’s digital world."),
                
                Topic(title: "School", emoji: "🏫", isCompleted: false, lessonDescription: "Learn how to talk about school and education in Spanish. Words like 'Clase' (Class), 'Profesor' (Teacher), and 'Estudiante' (Student) will help you navigate academic conversations.")
            ]
            persistenceManager.saveTopicsArray(topics)
            persistenceManager.setHasDataBeenLoaded()
            
            print("Created data and saved it since it had not been saved.")
        }
        
    }
}
