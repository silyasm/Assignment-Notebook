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
    
    @State var assignmentItems =
        [AssignmentItem(course: "Math", description: "workbook pages", dueDate: Date()),
         AssignmentItem(course: "English", description: "poem analysis", dueDate: Date()),
         AssignmentItem(course: "Biology", description: "read chapter 14", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.description)
                }
                    .onMove(perform: { indices, newOffset in
                        assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        assignmentItems.remove(atOffsets: indexSet)
                    })
            }
            .navigationBarTitle("Assignment List")
            .navigationBarItems(leading: EditButton())
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

