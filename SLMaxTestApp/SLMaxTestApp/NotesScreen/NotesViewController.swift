//
//  NotesViewController.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

enum HandleObserver {
    case add
    case remove
}

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleObserver(observerAction: .add)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        handleObserver(observerAction: .remove)
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
        handleObserver(observerAction: .add)
    }
}
