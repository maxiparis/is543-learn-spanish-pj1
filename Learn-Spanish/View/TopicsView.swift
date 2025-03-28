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
                Section(header: Text("Choose a topic to learn about it"), footer: Text("Finish a lesson before unlocking the next one")) {
                    ForEach(topicsVM.topics.indices, id: \.self) { topicIndex in
                        NavigationLink {
                            TopicIntroView(topicIntroVM: TopicIntroViewModel(topic: topicsVM.topics[topicIndex]), topicVM: topicsVM)
                        } label: {
                            Text("\(topicsVM.topics[topicIndex].emoji) \(topicsVM.topics[topicIndex].title)")
                        }
//                        .disabled(topicIndex == 0 ? false : !topicsVM.topics[previousIndex(topicIndex)].isEverythingCompleted)
                        //Comment out this line to enable all the topics at once
                        
                    }
                }
                
                Button("Restart data") {
                    topicsVM.resaveDataToDefaults()
                }
            }.navigationTitle("Learn Spanish")
        }
    }
    
    func previousIndex(_ index: Int) -> Int {
        max(index - 1, 0)
    }
}

#Preview {
    TopicsView()
}
