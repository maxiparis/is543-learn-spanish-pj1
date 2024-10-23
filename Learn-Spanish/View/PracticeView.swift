//
//  PracticeView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import SwiftUI

struct PracticeView: View {
    @State var practiceVM : PracticeViewModel //pass the topic from the previous view
    @State private var selectedLesson = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 20) {
                
                Spacer()
                
                ProgressView(value: Double(selectedLesson), total: Double(practiceVM.lessons.count-1)) {
                    Text("Progress")
                } currentValueLabel: {
                    Text("\(selectedLesson)/\(practiceVM.lessons.count-1)")
                }
                    .padding()
                    .progressViewStyle(.linear)
                
                Spacer()
                
                TabView(selection: $selectedLesson) {
                    ForEach(practiceVM.lessons.indices) { lessonIndex in
                        CardView(lesson: practiceVM.lessons[lessonIndex])
                            .tag(lessonIndex)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: geometry.size.height * 0.6)
                .padding()
                
                
                Spacer()
                HStack {
                    Button("Previous") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedLesson = max(selectedLesson - 1, 0)
                        }
                    }
                    
                    Button("Next") {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedLesson = min(selectedLesson + 1, practiceVM.lessons.count - 1)
                        }
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
                .foregroundColor(.secondary)
            
        }
    }
}

