//
//  NotesViewDelegate.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation
import UIKit

protocol NotesViewDelegateProtocol: AnyObject {
    func saveNote(note: NoteStructure)
    func changeAppTheme(theme: ThemeMode)
}

extension NotesViewController: NotesViewDelegateProtocol {
    func saveNote(note: NoteStructure) {
        notes.append(note)
        controllerView.tableView.beginUpdates()
        controllerView.tableView.insertSections([notes.count - 1],
                                                with: .none)
        controllerView.tableView.endUpdates()
    }
    
    func changeAppTheme(theme: ThemeMode) {
        if let window = controllerView.window?.windowScene?.keyWindow {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve) {
                switch theme {
                case .light:
                    window.overrideUserInterfaceStyle = .light
                case .dark:
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        }
    }
}
