//
//  NotesViewController.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

class NotesViewController: UIViewController {
    
    let controllerView = NotesView()
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    private func setupView() {
//        controllerView.tableView.dataSource = self
//        controllerView.tableView.delegate = self
    }
}
