//
//  NoteStructure.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation

struct NoteStructure {
    let title: String
    let description: String
    let date: String
    var isExpanded: Bool = false
    
    init(title: String,
         description: String,
         date: String,
         isExpanded: Bool = false) {
        self.title = title
        self.description = description
        self.date = date
        self.isExpanded = isExpanded
    }
}
