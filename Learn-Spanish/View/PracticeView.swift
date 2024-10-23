//
//  PracticeView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import SwiftUI

struct PracticeView: View {
    
    //MARK: - Variables

    @State var practiceVM : PracticeViewModel
    
    //MARK: - Body view

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 20) {
                
                Spacer()
                
                progressView
                
                swippeableCards(geometry: geometry)
                
                controlButtons
                
                Spacer()
            }
            .padding()
        }
    }
    
    //MARK: - Progress Bar

    var progressView: some View {
        ProgressView(value: Double(practiceVM.selectedLesson), total: Double(practiceVM.lessons.count-1)) {
            Text("Progress")
        } currentValueLabel: {
            Text("\(practiceVM.selectedLesson + 1)/\(practiceVM.lessons.count)")
        }
            .padding()
            .progressViewStyle(.linear)
    }
    
    //MARK: - Swippeable Cards

    func swippeableCards(geometry: GeometryProxy) -> some View {
        TabView(selection: $practiceVM.selectedLesson) {
            ForEach(0..<practiceVM.lessons.count, id: \.self) { lessonIndex in
                CardView(lesson: practiceVM.lessons[lessonIndex])
                    .tag(lessonIndex)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: geometry.size.height * 0.45)
        .padding()
    }
    
    //MARK: - Control Buttons

    var controlButtons: some View {
        HStack {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    practiceVM.navigatePrevCard()
                }
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 25))
                    .frame(width: 100, height: 40)
      
            }
            .buttonStyle(.bordered)
            
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    practiceVM.navigateNextCard()
                }
            } label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 25))
                    .frame(width: 100, height: 40)
            }
            .buttonStyle(.bordered)
        }
    }
}

//MARK: - CardView

struct CardView: View {
    var lesson: Lesson
    @State var showingEnglish: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor( showingEnglish ? .blue.opacity(0.5) : .green.opacity(0.5))
            if showingEnglish {
                Text(lesson.phraseInEnglish)
            } else {
                Text(lesson.phraseInSpanish)
            }

        }
        .onTapGesture {
            withAnimation() {
                showingEnglish.toggle()
            }
        }
    }
}
