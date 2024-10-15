//
//  TopicIntroView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicIntroView: View {
    var topic: Topic
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Lesson")
                    .font(.title)
                Spacer()
            }
        }.navigationTitle(topic.title)
    }
}

#Preview {
    TopicIntroView(topic: Topic(title: "Travel", emoji: "✈️", isCompleted: false))
}
