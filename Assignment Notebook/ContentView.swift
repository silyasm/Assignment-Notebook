//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.system(size: 20, weight: .bold, design: .serif))
                                .foregroundColor(.red)
                            Text(item.description)
                            Text("Due: \(item.dueDate, style: .date)")
                        }
                        Spacer()
                    }
                }
                    .onMove(perform: { indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        assignmentList.items.remove(atOffsets: indexSet)
                    })
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarTitle("Assignment List")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true}) {
                                                    Image(systemName: "plus")
                                })
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
