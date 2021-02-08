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
    
    var AssignmentItems =
        [AssignmentItem(course: "Math", description: "workbook pages", dueDate: Date()),
         AssignmentItem(course: "English", description: "poem analysis", dueDate: Date()),
         AssignmentItem(course: "Biology", description: "read chapter 14", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(AssignmentItems) { AssignmentItem in
                    Text(AssignmentItem.description)
                }
            }
            .navigationBarTitle("Assignment List")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
