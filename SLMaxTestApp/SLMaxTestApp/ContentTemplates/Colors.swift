//
//  Colors.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import Foundation
import UIKit

enum Colors {
    enum Main {
        static let appTitle = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let background: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                let darkTheme = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let clear = UIColor.clear
    }
    
    enum Note {
        static let mainColor: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                let darkTheme = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let cellBorder = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        static let noteAddBorder: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
                let darkTheme = UIColor(red: 0.49, green: 0.49, blue: 0.49, alpha: 0.61)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let background = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        static let noteDeletionBackground = UIColor(red: 0.892, green: 0, blue: 0, alpha: 1)
        static let noteDeletionTint = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let horizontalSeparator: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0.825, green: 0.825, blue: 0.825, alpha: 1)
                let darkTheme = UIColor(red: 0.492, green: 0.492, blue: 0.492, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let date: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
                let darkTheme = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
    }
    
    enum Comment {
        static let mainColor: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                let darkTheme = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let commentBorder: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
                let darkTheme = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let commentParameter = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
    }
    
    enum DatePicker {
        static let date: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                let darkTheme = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
        static let underline: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0.796, green: 0.796, blue: 0.796, alpha: 1)
                let darkTheme = UIColor(red: 0.167, green: 0.167, blue: 0.167, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
    }
    
    enum ThemeSwitcher {
        static let highlight = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let background: UIColor = {
            return UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
                let lightTheme = UIColor(red: 0.064, green: 0.389, blue: 0.492, alpha: 1)
                let darkTheme = UIColor(red: 0.451, green: 0.388, blue: 0.82, alpha: 1)
                return uiTraitCollection.userInterfaceStyle == .light ? lightTheme : darkTheme
            }
        }()
    }
}
