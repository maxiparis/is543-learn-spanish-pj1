//
//  PracticeView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import SwiftUI

struct PracticeView: View {
    @State var practiceVM : PracticeViewModel //pass the topic from the previous view
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                ProgressView()
                    .padding()
                    .progressViewStyle(.linear)
                Spacer()
                
                CardView(lesson: Lesson(phraseInEnglish: "Hello World", phraseInSpanish: "Hola Mundo"))
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3)

                
                Spacer()
                HStack {
                    Button("Previous") {
                        
                    }
                    
                    Button("Next") {
                        
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct CardView: View {
    var lesson: Lesson
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
        }
    }
}

