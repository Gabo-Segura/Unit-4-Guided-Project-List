//
//  ToDo.swift
//  ToDoList
//
//  Created by Gabo on 1/28/22.
//  Copyright © 2022 Gabo. All rights reserved.
//

import Foundation

struct ToDo: Equatable, Codable{
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool{
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        /*let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
        
        return [todo1, todo2, todo3]*/
        
        guard let codedToDos = try? Data(contentsOf: archiveURL) else
        {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self,
            from: codedToDos)
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask).first!
    
    
    static let archiveURL =
        documentsDirectory.appendingPathComponent("todos")
            .appendingPathExtension("plist")
    
    
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
}
