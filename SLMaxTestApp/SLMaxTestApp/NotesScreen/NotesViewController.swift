//
//  NotesViewController.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

final class NotesViewController: UIViewController {
    
    let controllerView = NotesView()
    var notes: [NoteStructure] = []
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    private func setupView() {
        controllerView.tableView.dataSource = self
        controllerView.tableView.delegate = self
        controllerView.notesViewDelegate = self
        controllerView.textFieldsView.titleField.delegate = self
    }
}
