//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    struct AssignmentItem: Identifiable, Codable {
        var id = UUID()
        var course = String()
        var description = String()
        var dueDate = Date()
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
