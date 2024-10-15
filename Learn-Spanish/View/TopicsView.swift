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
            List(topicsVM.topics) { topic in
                NavigationLink {
                    
                } label: {
                    Text("\(topic.emoji) \(topic.title)")
                }

            }.navigationTitle("Learn Spanish")
        }
    }
}

#Preview {
    TopicsView()
}
