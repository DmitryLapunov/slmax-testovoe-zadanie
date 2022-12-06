//
//  NotesViewDelegate.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation

protocol NotesViewDelegateProtocol: AnyObject {
    func saveNote(note: NoteStructure)
}

extension NotesViewController: NotesViewDelegateProtocol {
    func saveNote(note: NoteStructure) {
        notes.append(note)
        controllerView.tableView.beginUpdates()
        controllerView.tableView.insertSections([notes.count - 1],
                                                with: .none)
        controllerView.tableView.endUpdates()
    }
}
