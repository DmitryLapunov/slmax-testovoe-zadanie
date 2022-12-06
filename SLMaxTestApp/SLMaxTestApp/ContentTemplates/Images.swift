//
//  Images.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import Foundation
import UIKit

enum Images {
    enum Header {
        static let rectangleBack = UIImage(named: "rectangle_back")
        static let rectangleFront = UIImage(named: "rectangle_front")
    }
    
    enum Icons {
        static let calendar = UIImage(named: "calendar")
        static let darkTheme = UIImage(named: "dark_theme")
        static let lightTheme = UIImage(named: "light_theme")
        static let cancel = UIImage(systemName: "arrow.triangle.2.circlepath")
        static let chevronDown = UIImage(systemName: "chevron.down")
        static let chevronUp = UIImage(systemName: "chevron.up")
    }
}
