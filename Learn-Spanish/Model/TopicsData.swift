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
    
    mutating func loadData() {
        if let updatedTopics = persistenceManager.loadTopicsArray() {
            self.topics = updatedTopics
            print("Topics were updated for the TopicView")
            return
        }
        print("Topics were NOT updated for the TopicView")
    }
    
    mutating func forceSavingData() {

        topics = [
            Topic(title: "Basic", emoji: "⭐️", isShortLessonCompleted: false, lessonDescription: """
                    Welcome to Spanish Basics!

                    Learning Spanish can be incredibly rewarding. Spoken by over 500 million people worldwide, Spanish is the official language of 21 countries, with significant cultural and regional diversity. Here, we’ll cover some fundamentals to get you started!

                    1. Greetings and Politeness:
                    Start with the basics of polite conversation! Saying “Hola” (Hello) is a friendly greeting, while “Adiós” (Goodbye) is a simple way to part. “Por favor” (Please) and “Gracias” (Thank you) are key words for showing courtesy, while “Sí” (Yes) and “No” (No) will help you communicate affirmatively or negatively.

                    2. Key Pronouns and Verbs:
                    In Spanish, personal pronouns include “Yo” (I), “Tú” (You - informal), “Él” (He), “Ella” (She), “Nosotros” (We), and “Ellos” (They). The verb "to be" translates as “ser” or “estar,” depending on context. “Ser” relates to permanent qualities (e.g., “Yo soy estudiante” – I am a student), while “estar” describes temporary states (e.g., “Estoy cansado” – I am tired).

                    3. Simple Questions and Responses:
                    Ask someone how they’re doing with “¿Cómo estás?” (How are you?), and they might reply, “Estoy bien, gracias” (I’m well, thank you) or “Estoy cansado” (I’m tired).

                    """,
                  lessons: [
                      Lesson(phraseInEnglish: "Hello", phraseInSpanish: "Hola"),
                      Lesson(phraseInEnglish: "Goodbye", phraseInSpanish: "Adiós"),
                      Lesson(phraseInEnglish: "Yes", phraseInSpanish: "Sí"),
                      Lesson(phraseInEnglish: "No", phraseInSpanish: "No"),
                      Lesson(phraseInEnglish: "Please", phraseInSpanish: "Por favor"),
                      Lesson(phraseInEnglish: "Thank you", phraseInSpanish: "Gracias"),
                      Lesson(phraseInEnglish: "You're welcome", phraseInSpanish: "De nada"),
                      Lesson(phraseInEnglish: "How are you?", phraseInSpanish: "¿Cómo estás?"),
                      Lesson(phraseInEnglish: "Nice to meet you", phraseInSpanish: "Mucho gusto"),
                      Lesson(phraseInEnglish: "I’m fine", phraseInSpanish: "Estoy bien"),
                      Lesson(phraseInEnglish: "I'm sorry", phraseInSpanish: "Lo siento")
                  ]),
            
            Topic(title: "Numbers", emoji: "1️⃣", isShortLessonCompleted: false, lessonDescription: """
                Introduction to Spanish Numbers

                Numbers in Spanish are straightforward once you learn their basic patterns! Let’s go over some foundational vocabulary and patterns to help you count in Spanish, from 1 to 100 and beyond.

                1. Numbers 1-10:
                The numbers from 1 to 10 have unique names:

                1 - Uno
                2 - Dos
                3 - Tres
                4 - Cuatro
                5 - Cinco
                6 - Seis
                7 - Siete
                8 - Ocho
                9 - Nueve
                10 - Diez
                These are essential to memorize as they form the basis for building larger numbers.

                2. Numbers 11-20:
                The numbers 11 through 15 also have unique names, while 16-19 follow a pattern combining "dieci-" with the single digits:

                11 - Once
                12 - Doce
                13 - Trece
                14 - Catorce
                15 - Quince
                16 - Dieciséis
                17 - Diecisiete
                18 - Dieciocho
                19 - Diecinueve
                20 - Veinte
                3. Numbers 21-29:
                From here, numbers follow a pattern. For example, “21” is veintiuno (combining veinte + uno), “22” is veintidós, and so on up to “29,” or veintinueve.

                4. Tens: 30, 40, 50, etc.
                The tens have unique names, and the single numbers are added with "y" (and):

                30 - Treinta
                40 - Cuarenta
                50 - Cincuenta
                60 - Sesenta
                70 - Setenta
                80 - Ochenta
                90 - Noventa
                For example, “31” is treinta y uno, and “42” is cuarenta y dos.

                5. Hundreds and Beyond:
                Once you hit 100, Spanish uses "ciento," as in:

                100 - Cien (or ciento when followed by other numbers, e.g., ciento uno for 101)
                """,
                  lessons: [
                      Lesson(phraseInEnglish: "One", phraseInSpanish: "Uno"),
                      Lesson(phraseInEnglish: "Two", phraseInSpanish: "Dos"),
                      Lesson(phraseInEnglish: "Three", phraseInSpanish: "Tres"),
                      Lesson(phraseInEnglish: "Four", phraseInSpanish: "Cuatro"),
                      Lesson(phraseInEnglish: "Five", phraseInSpanish: "Cinco"),
                      Lesson(phraseInEnglish: "Six", phraseInSpanish: "Seis"),
                      Lesson(phraseInEnglish: "Seven", phraseInSpanish: "Siete"),
                      Lesson(phraseInEnglish: "Eight", phraseInSpanish: "Ocho"),
                      Lesson(phraseInEnglish: "Nine", phraseInSpanish: "Nueve"),
                      Lesson(phraseInEnglish: "Ten", phraseInSpanish: "Diez")
                  ]),
            
            Topic(title: "Greetings", emoji: "👋", isShortLessonCompleted: false, lessonDescription: """
                  Spanish Greetings: A Guide to Polite Conversation

                  Greetings are essential in any language as they set the tone for a conversation. In Spanish, greetings vary by formality and context, making them rich and diverse. Here’s an overview of common Spanish greetings to help you navigate social interactions.

                  1. Basic Greetings:
                  The simplest and most common greeting is “Hola,” which means “Hello.” It’s informal and can be used with friends and family. Another casual greeting is “¿Qué tal?” (How’s it going?), which invites a friendly response.

                  2. Formal Greetings:
                  When addressing someone in a more formal setting or showing respect, use “Buenos días” (Good morning) until around noon, “Buenas tardes” (Good afternoon) from noon until the evening, and “Buenas noches” (Good evening or Good night) in the evening or night. These phrases are important for professional or polite interactions.

                  3. Asking About Well-Being:
                  After a greeting, it’s common to ask how someone is doing. Use “¿Cómo estás?” (How are you?) in informal contexts. In formal situations, opt for “¿Cómo está usted?” (How are you?). Common responses include “Estoy bien, gracias” (I’m fine, thank you) or “¿Y tú?” (And you?).

                  4. Farewells:
                  When it’s time to say goodbye, you can use “Adiós” (Goodbye) for a straightforward farewell. For a more casual farewell, try “Hasta luego” (See you later) or “Nos vemos” (We’ll see each other). For a more extended goodbye, say “Hasta la próxima” (Until next time).
                  """,
                  lessons: [
                      Lesson(phraseInEnglish: "Hi", phraseInSpanish: "Hola"),
                      Lesson(phraseInEnglish: "Good morning", phraseInSpanish: "Buenos días"),
                      Lesson(phraseInEnglish: "Good evening", phraseInSpanish: "Buenas noches"),
                      Lesson(phraseInEnglish: "Good afternoon", phraseInSpanish: "Buenas tardes"),
                      Lesson(phraseInEnglish: "See you later", phraseInSpanish: "Hasta luego"),
                      Lesson(phraseInEnglish: "See you tomorrow", phraseInSpanish: "Hasta mañana"),
                      Lesson(phraseInEnglish: "Take care", phraseInSpanish: "Cuídate")
                  ]),
            
            Topic(title: "Colors", emoji: "🎨", isShortLessonCompleted: false, lessonDescription: """
                    Exploring Colors in Spanish: A Colorful Lesson

                    Understanding colors is an essential part of learning any language, and Spanish is no exception! Colors not only help us describe the world around us but also enrich our conversations. Here’s a guide to some common colors in Spanish and how to use them.

                    1. Basic Colors:
                    Let’s start with the most common colors, which you’ll find useful in everyday conversation:

                    Red - Rojo
                    Blue - Azul
                    Green - Verde
                    Yellow - Amarillo
                    Black - Negro
                    White - Blanco
                    Orange - Naranja
                    Purple - Púrpura
                    Pink - Rosa
                    Brown - Marrón
                    
                    2. Using Colors in Sentences:
                    Colors in Spanish agree with the nouns they modify in gender and number. For example, if you're talking about a masculine noun, the color stays singular. For feminine nouns, add an “a.” When pluralizing, add “s” or “es” as needed. Here are some examples:

                    The red apple: La manzana roja (feminine, singular)
                    The green cars: Los coches verdes (masculine, plural)
                    The blue dress: El vestido azul (masculine, singular)
                    3. Describing Objects:
                    Colors allow you to describe objects more vividly. You can say, “Me gusta el coche rojo” (I like the red car) or “Ella lleva un vestido amarillo” (She is wearing a yellow dress). Using colors in descriptions makes your speech more colorful and engaging.

                    4. Combining Colors:
                    In Spanish, you can also combine colors to create new shades. For instance:

                    Light blue - Azul claro
                    Dark green - Verde oscuro
                    Bright yellow - Amarillo brillante

                    """,
                  lessons: [
                      Lesson(phraseInEnglish: "Red", phraseInSpanish: "Rojo"),
                      Lesson(phraseInEnglish: "Blue", phraseInSpanish: "Azul"),
                      Lesson(phraseInEnglish: "Green", phraseInSpanish: "Verde"),
                      Lesson(phraseInEnglish: "Yellow", phraseInSpanish: "Amarillo"),
                      Lesson(phraseInEnglish: "Black", phraseInSpanish: "Negro"),
                      Lesson(phraseInEnglish: "White", phraseInSpanish: "Blanco"),
                      Lesson(phraseInEnglish: "Purple", phraseInSpanish: "Morado"),
                      Lesson(phraseInEnglish: "Pink", phraseInSpanish: "Rosa")
                  ]),
            
            Topic(title: "Family", emoji: "👨‍👩‍👧", isShortLessonCompleted: false, lessonDescription: """
                Family Vocabulary in Spanish: A Guide to Family Relationships

                Understanding family vocabulary is crucial when learning Spanish, as discussing family is a common topic in everyday conversations. Let’s explore the essential terms related to family relationships and how to use them in sentences.

                1. Immediate Family Members:
                Here are some key terms for immediate family members:

                Mother - Madre
                Father - Padre
                Brother - Hermano
                Sister - Hermana
                Son - Hijo
                Daughter - Hija
                These basic terms are fundamental and form the core of family discussions.

                2. Extended Family:
                In addition to immediate family, Spanish has specific terms for extended family members:

                Grandfather - Abuelo
                Grandmother - Abuela
                Uncle - Tío
                Aunt - Tía
                Cousin - Primo (male) / Prima (female)
                Using these terms helps you describe your entire family tree.

                3. Family Relationships in Context:
                When speaking about your family, you can construct simple sentences to describe your relationships. For example:

                “Mi madre se llama Ana” (My mother’s name is Ana).
                “Tengo un hermano y una hermana” (I have one brother and one sister).
                “Mis abuelos viven en España” (My grandparents live in Spain).
                4. Possessive Adjectives:
                In Spanish, possessive adjectives are used to show relationships within the family. Here are the most common possessive adjectives:

                My - Mi
                Your (informal) - Tu
                His/Her - Su
                Our - Nuestro/a
                Their - Su
                For instance, you can say:

                “Este es mi padre” (This is my father).
                “Esa es nuestra tía” (That is our aunt).
                """,
                  lessons: [
                      Lesson(phraseInEnglish: "Mother", phraseInSpanish: "Madre"),
                      Lesson(phraseInEnglish: "Father", phraseInSpanish: "Padre"),
                      Lesson(phraseInEnglish: "Brother", phraseInSpanish: "Hermano"),
                      Lesson(phraseInEnglish: "Sister", phraseInSpanish: "Hermana"),
                      Lesson(phraseInEnglish: "Grandmother", phraseInSpanish: "Abuela"),
                      Lesson(phraseInEnglish: "Grandfather", phraseInSpanish: "Abuelo"),
                      Lesson(phraseInEnglish: "Uncle", phraseInSpanish: "Tío"),
                      Lesson(phraseInEnglish: "Aunt", phraseInSpanish: "Tía")
                  ]),
            
            Topic(title: "Food & Drink", emoji: "🍎", isShortLessonCompleted: false, lessonDescription: """
                Food and Drink Vocabulary in Spanish: A Culinary Exploration

                Learning about food and drink is an essential aspect of mastering any language, and Spanish is no exception. Food is a universal topic that brings people together, making it a valuable part of your vocabulary. Here’s a guide to common food and drink terms in Spanish and how to use them in conversation.

                1. Common Food Vocabulary: Here are some essential food-related words you should know:

                Food - Comida
                Bread - Pan
                Fruit - Fruta
                Vegetable - Verdura
                Meat - Carne
                Fish - Pescado
                Rice - Arroz
                Cheese - Queso
                Egg - Huevo
                These terms are foundational and will help you navigate menus and grocery lists.

                2. Common Drink Vocabulary: Now let’s explore essential drinks:

                Water - Agua
                Juice - Jugo
                Coffee - Café
                Tea - Té
                Milk - Leche
                Wine - Vino
                Beer - Cerveza
                Soda - Refresco
                Knowing these terms can enhance your dining experiences and conversations about beverages.

                3. Using Food and Drink in Sentences: Incorporating food and drink vocabulary into sentences can help you express preferences or make requests. Here are some examples:

                “Me gusta la fruta, especialmente las fresas” (I like fruit, especially strawberries).
                “¿Quieres un poco de pan?” (Do you want some bread?).
                “Voy a pedir un café” (I am going to order a coffee).

                """,
                  lessons: [
                      Lesson(phraseInEnglish: "Food", phraseInSpanish: "Comida"),
                      Lesson(phraseInEnglish: "Water", phraseInSpanish: "Agua"),
                      Lesson(phraseInEnglish: "Bread", phraseInSpanish: "Pan"),
                      Lesson(phraseInEnglish: "Fruit", phraseInSpanish: "Fruta"),
                      Lesson(phraseInEnglish: "Vegetables", phraseInSpanish: "Verduras"),
                      Lesson(phraseInEnglish: "Rice", phraseInSpanish: "Arroz"),
                      Lesson(phraseInEnglish: "Chicken", phraseInSpanish: "Pollo"),
                      Lesson(phraseInEnglish: "Meat", phraseInSpanish: "Carne")
                  ]),
            
            Topic(title: "Weather", emoji: "☀️", isShortLessonCompleted: false, lessonDescription: """
                Weather Vocabulary in Spanish: A Guide to Discussing the Elements

                Talking about the weather is a common conversational starter in any language, and Spanish is no exception. Understanding weather-related vocabulary will help you engage in everyday conversations and understand the climate in Spanish-speaking countries. Here’s a comprehensive guide to weather terms and how to use them effectively.

                1. Basic Weather Vocabulary: Start with these essential terms to describe different weather conditions:

                Weather - Clima
                Rain - Lluvia
                Sun - Sol
                Wind - Viento
                Snow - Nieve
                Cloud - Nube
                Storm - Tormenta
                Fog - Niebla
                Temperature - Temperatura
                These basic terms will help you understand and discuss the weather more effectively.

                2. Common Weather Phrases: Incorporating weather vocabulary into phrases can help you communicate more naturally. Here are some examples:

                “Hace calor” (It’s hot).
                “Está lloviendo” (It’s raining).
                “Hace frío” (It’s cold).
                “Hay viento” (It’s windy).
                “Está nublado” (It’s cloudy).
                “Está nevando” (It’s snowing).
                Using these phrases in conversation will make your speech more fluid and relatable.

                3. Talking About the Forecast: When discussing the weather forecast, you can use the following phrases:

                “El pronóstico del tiempo dice que va a llover” (The weather forecast says it’s going to rain).
                “Mañana hará buen tiempo” (Tomorrow will be nice weather).
                “La temperatura será de 20 grados” (The temperature will be 20 degrees).
                These expressions will help you articulate your thoughts about future weather conditions.
                """,
                  lessons: [
                      Lesson(phraseInEnglish: "It's hot", phraseInSpanish: "Hace calor"),
                      Lesson(phraseInEnglish: "It's raining", phraseInSpanish: "Está lloviendo"),
                      Lesson(phraseInEnglish: "It's cold", phraseInSpanish: "Hace frío"),
                      Lesson(phraseInEnglish: "It's sunny", phraseInSpanish: "Está soleado"),
                      Lesson(phraseInEnglish: "It's windy", phraseInSpanish: "Hace viento"),
                      Lesson(phraseInEnglish: "It's cloudy", phraseInSpanish: "Está nublado"),
                      Lesson(phraseInEnglish: "It's snowing", phraseInSpanish: "Está nevando")
                  ]),
            
            Topic(title: "Occupations", emoji: "💼", isShortLessonCompleted: false, lessonDescription: """
                Occupations Vocabulary in Spanish: Exploring Careers and Professions

                Understanding vocabulary related to occupations is essential for engaging in conversations about work and career paths in Spanish-speaking cultures. Whether you're discussing your job, asking about someone else's profession, or exploring new career opportunities, having a solid grasp of occupational terms will enhance your communication skills. Here’s a comprehensive guide to essential vocabulary and phrases related to occupations.

                1. Basic Occupation Vocabulary: Start with these fundamental terms to describe various professions:

                Occupation - Ocupación
                Job - Trabajo
                Profession - Profesión
                Employee - Empleado/a
                Employer - Empleador/a
                These terms lay the groundwork for discussing careers and work environments.

                2. Common Occupations: Here’s a list of some common occupations you might encounter:

                Doctor - Médico/a
                Teacher - Profesor/a
                Engineer - Ingeniero/a
                Nurse - Enfermero/a
                Lawyer - Abogado/a
                Artist - Artista
                Chef - Cocinero/a
                Journalist - Periodista
                Accountant - Contador/a
                Salesperson - Vendedor/a
                Knowing these terms will help you navigate discussions about different careers and understand the job market better.

                3. Using Occupation Vocabulary in Sentences: Incorporating occupational vocabulary into sentences allows you to express your career aspirations or inquire about others' professions. Here are some examples:

                “Soy médico y trabajo en un hospital” (I am a doctor and work in a hospital).
                “Ella es profesora de matemáticas” (She is a math teacher).
                “Mi hermano es ingeniero y trabaja en tecnología” (My brother is an engineer and works in technology).
                These sentences demonstrate how to use occupational vocabulary in context.
                """,
                  lessons: [
                      Lesson(phraseInEnglish: "Doctor", phraseInSpanish: "Médico"),
                      Lesson(phraseInEnglish: "Teacher", phraseInSpanish: "Profesor"),
                      Lesson(phraseInEnglish: "Engineer", phraseInSpanish: "Ingeniero"),
                      Lesson(phraseInEnglish: "Nurse", phraseInSpanish: "Enfermera"),
                      Lesson(phraseInEnglish: "Lawyer", phraseInSpanish: "Abogado"),
                      Lesson(phraseInEnglish: "Artist", phraseInSpanish: "Artista"),
                      Lesson(phraseInEnglish: "Painter", phraseInSpanish: "Pintor"),
                      Lesson(phraseInEnglish: "Farmer", phraseInSpanish: "Agricultor")
                  ]),
            
            Topic(title: "Clothing", emoji: "👗", isShortLessonCompleted: false, lessonDescription: """
                Clothing Vocabulary in Spanish: Dressing for Every Occasion

                Understanding clothing vocabulary in Spanish is essential for discussing fashion, shopping, and personal style. Whether you’re exploring a new wardrobe, shopping in a Spanish-speaking country, or simply wanting to describe what you or someone else is wearing, knowing the right terms will enhance your conversational skills. Here’s a guide to essential vocabulary and phrases related to clothing.

                1. Basic Clothing Vocabulary: Start with these fundamental terms to describe different types of clothing:

                Clothing - Ropa
                Outfit - Conjunto
                Accessory - Accesorio
                Fabric - Tela
                Size - Tamaño
                These basic terms will help you navigate conversations about clothing and style.

                2. Common Clothing Items: Here’s a list of common clothing items you might encounter:

                Shirt - Camisa
                Pants - Pantalones
                Dress - Vestido
                Skirt - Falda
                Shoes - Zapatos
                Hat - Sombrero
                Coat - Abrigo
                Jacket - Chaqueta
                Socks - Calcetines
                Shorts - Pantalones cortos
                Knowing these terms will help you describe outfits and make shopping easier.

                3. Using Clothing Vocabulary in Sentences: Incorporating clothing vocabulary into sentences allows you to express your style or inquire about others' clothing. Here are some examples:

                “Me gusta tu vestido rojo” (I like your red dress).
                “¿Dónde compraste esos zapatos?” (Where did you buy those shoes?).
                “Ella lleva una chaqueta de cuero” (She is wearing a leather jacket).
                These sentences show how to use clothing vocabulary in context.

                4. Asking About Clothing: To inquire about someone’s outfit or fashion choices, you can use simple questions such as:

                “¿Qué ropa llevas hoy?” (What clothes are you wearing today?).
                “¿Cuál es tu prenda favorita?” (What is your favorite piece of clothing?).
                “¿Te gusta este sombrero?” (Do you like this hat?).
                These questions can initiate discussions about fashion and personal style.


            """,
                  lessons: [
                      Lesson(phraseInEnglish: "Shirt", phraseInSpanish: "Camisa"),
                      Lesson(phraseInEnglish: "Pants", phraseInSpanish: "Pantalones"),
                      Lesson(phraseInEnglish: "Shoes", phraseInSpanish: "Zapatos"),
                      Lesson(phraseInEnglish: "Dress", phraseInSpanish: "Vestido"),
                      Lesson(phraseInEnglish: "Hat", phraseInSpanish: "Sombrero"),
                      Lesson(phraseInEnglish: "Socks", phraseInSpanish: "Calcetines"),
                      Lesson(phraseInEnglish: "Jacket", phraseInSpanish: "Chaqueta")
                  ])
        ]
        
        persistenceManager.saveTopicsArray(topics)
        persistenceManager.setHasDataBeenLoaded()
        
        print("Created data and saved it since it had not been saved.")
    }
}
