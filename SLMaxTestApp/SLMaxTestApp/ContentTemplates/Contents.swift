//
//  Contents.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import Foundation

enum Contents {
    enum Main {
        static let appTitle = "Заметки"
        static let chevronRight = "\u{203A}"
        static let keyboardDoneButton = "Готово"
    }
    
    enum Note {
        static let noteTitle = "Название заметки"
        static let noteDescription = "Описание заметки"
        static let threeDots = "..."
    }
    
    enum Comment {
        static let commentTitle = "Название комментария"
        static let commentResponse = "Ответ на комментарий"
        static let commentText = "Текст комментария"
        static let respondToComment = "Ответить"
    }
}
