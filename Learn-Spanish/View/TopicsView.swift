//
//  ContentView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicsView: View {
    
    @State var topicsVM = TopicsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Choose a topic to learn about it")) {
                    ForEach(topicsVM.topics) { topic in
                        NavigationLink {
                            TopicIntroView(topicIntroVM: TopicIntroViewModel(topic: topic))
                        } label: {
                            Text("\(topic.emoji) \(topic.title)")
                        }
                    }
                }
                
                Button("Restart data") {
                    topicsVM.resaveDataToDefaults()
                }
            }.navigationTitle("Learn Spanish")
        }
    }
}

#Preview {
    TopicsView()
}
