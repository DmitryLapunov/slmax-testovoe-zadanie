//
//  Fonts.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import Foundation
import UIKit

enum Fonts {
    enum Main {
        static let appTitle = UIFont(name: RalewayFont.semibold, size: 28)
        static let datePicker = UIFont(name: RalewayFont.light, size: 13)
    }
    
    enum Note {
        static let noteTitle = UIFont(name: RalewayFont.semibold, size: 14)
        static let noteShortDescription = UIFont(name: RalewayFont.light, size: 8)
        static let noteDescription = UIFont(name: RalewayFont.light, size: 10)
        static let noteDate = UIFont(name: RalewayFont.light, size: 8)
        static let noteDeletion = UIFont(name: RalewayFont.semibold, size: 12)
    }
    
    enum Comment {
        static let commentTitle = UIFont(name: RalewayFont.semibold, size: 10)
        static let commentText = UIFont(name: RalewayFont.light, size: 8)
        static let commentDate = UIFont(name: RalewayFont.light, size: 7)
        static let respondToComment = UIFont(name: RalewayFont.semibold, size: 7)
        static let allResponses = UIFont(name: RalewayFont.semibold, size: 8)
    }
}
