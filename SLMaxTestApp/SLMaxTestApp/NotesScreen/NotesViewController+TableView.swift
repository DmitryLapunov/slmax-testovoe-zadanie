//
//  NotesViewController+TableView.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import Foundation
import UIKit

extension NotesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let note = notes[section]
        return note.isExpanded ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath)
            let noteCell = cell as? NoteCell
            noteCell?.setupCell(note: notes[indexPath.section])
            return noteCell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.reuseIdentifier, for: indexPath)
            let descriptionCell = cell as? DescriptionCell
            descriptionCell?.setupCell(note: notes[indexPath.section])
            return descriptionCell ?? UITableViewCell()
        }
    }
}

extension NotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        notes[indexPath.section].isExpanded = !notes[indexPath.section].isExpanded
        tableView.reloadSections([indexPath.section], with: .automatic)
    }
}
