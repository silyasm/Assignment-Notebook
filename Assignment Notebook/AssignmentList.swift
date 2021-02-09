//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 2/9/21.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "workbook pages", dueDate: Date()),
                             AssignmentItem(course: "English", description: "poem analysis", dueDate: Date()),
                             AssignmentItem(course: "Biology", description: "read chapter 14", dueDate: Date())]
}
