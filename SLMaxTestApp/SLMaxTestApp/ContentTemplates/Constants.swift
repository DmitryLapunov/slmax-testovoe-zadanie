//
//  Constants.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import Foundation
import UIKit

enum Constants {
    enum Main {
        static let titleTop: CGFloat = 80
        static let tableViewTop: CGFloat = 29
        static let tableViewBottom: CGFloat = -29
        static let basicLeading: CGFloat = 30
        static let basicTrailing: CGFloat = -30
        static let headerFrontHeight: CGFloat = UIScreen.main.bounds.width / 1.965
        static let headerBackHeight: CGFloat = UIScreen.main.bounds.width / 2.05
        static let borderWidth: CGFloat = 1
    }
    
    enum Note {
        static let basicLeading: CGFloat = 30
        static let basicTrailing: CGFloat = -30
        static let titleLeading: CGFloat = 17
        static let titleTop: CGFloat = 10
        static let titleBottom: CGFloat = -10
        static let titleTrailing: CGFloat = -6.5
        static let separatorLeading: CGFloat = 92
        static let separatorHeight: CGFloat = 15
        static let separatorWidth: CGFloat = 0.5
        static let shortDescriptionLeading: CGFloat = 8.5
        static let shortDescriptionTrailing: CGFloat = -13
        static let arrowTrailing: CGFloat = -22
        static let arrowWidth: CGFloat = 8
        static let arrowHeight: CGFloat = 4
        static let arrowCenterYOffset: CGFloat = 1
        static let cornerRadius: CGFloat = 5
        static let bottomSpacing: CGFloat = -10
        static let titleMaxCharactersCount = 25
    }
    
    enum Description {
        static let dateTrailing: CGFloat = -22
        static let descriptionTop: CGFloat = 17
        static let descriptionBottom: CGFloat = -37
        static let descriptionLeading: CGFloat = 17
        static let descriptionTrailing: CGFloat = -17
        static let separatorBottom: CGFloat = -10
        static let separatorHeight: CGFloat = 1
    }
    
    enum TextFields {
        static let bottom: CGFloat = -42
        static let titleFieldTop: CGFloat = 17
        static let titleFieldLeading: CGFloat = 21
        static let titleFieldTrailing: CGFloat = -27
        static let separatorTop: CGFloat = 7
        static let separatorLeading: CGFloat = 17
        static let separatorTrailing: CGFloat = -27
        static let separatorHeight: CGFloat = 1
        static let descriptionTop: CGFloat = 11
        static let descriptionLeading: CGFloat = 21
        static let descriptionTrailing: CGFloat = -19
        static let descriptionBottom: CGFloat = -19
        static let buttonTrailing: CGFloat = -19
        static let buttonWidth: CGFloat = 24
        static let buttonHeight: CGFloat = 26
        static let cornerRadius: CGFloat = 10
    }
    
    enum Label {
        static let singleLine = 1
        static let infiniteLines = 0
    }
}
