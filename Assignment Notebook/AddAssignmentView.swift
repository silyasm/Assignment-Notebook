//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Student on 2/9/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
@Environment(\.presentationMode) var presentationMode
static let courses = ["Math", "English", "History", "Science", "World Language"]
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.blue)
                    }
                }
                TextField("Description", text: $description).font(.system(size: 20, weight: .medium))
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .font(.system(size: 20, weight: .bold))
            .navigationBarTitle("Add Assignment")
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: course,
                                        description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
