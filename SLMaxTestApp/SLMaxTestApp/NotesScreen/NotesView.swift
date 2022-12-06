//
//  NotesView.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

final class NotesView: UIView {
    
    weak var notesViewDelegate: NotesViewDelegateProtocol?
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Header.rectangleBack
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var frontView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Header.rectangleFront
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Main.appTitle
        label.textColor = Colors.Main.appTitle
        label.text = Contents.Main.appTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let customSwitcher = CustomSwitcher()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Colors.Main.background
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let textFieldsView = TextFieldsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.Main.background
        passNoteStructure()
        changeAppTheme()
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        addSubview(backView)
        addSubview(frontView)
        frontView.addSubview(titleLabel)
        addSubview(customSwitcher)
        addSubview(tableView)
        addSubview(textFieldsView)
    }
    
    private func setConstraints() {
        backView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backView.heightAnchor.constraint(equalToConstant: Constants.Main.headerBackHeight).isActive = true
        
        frontView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        frontView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        frontView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        frontView.heightAnchor.constraint(equalToConstant: Constants.Main.headerFrontHeight).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: frontView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: frontView.topAnchor,
                                        constant: Constants.Main.titleTop).isActive = true
        
        customSwitcher.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: Constants.Main.basicTrailing).isActive = true
        customSwitcher.topAnchor.constraint(equalTo: frontView.bottomAnchor,
                                            constant: Constants.ThemeSwitcher.switcherTop).isActive = true
        customSwitcher.widthAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.switcherWidth).isActive = true
        customSwitcher.heightAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.switcherHeight).isActive = true
        
        tableView.topAnchor.constraint(equalTo: frontView.bottomAnchor,
                                       constant: Constants.Main.tableViewTop).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                           constant: Constants.Main.basicLeading).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                            constant: Constants.Main.basicTrailing).isActive = true
        tableView.bottomAnchor.constraint(equalTo: textFieldsView.topAnchor,
                                          constant: Constants.Main.tableViewBottom).isActive = true
        
        textFieldsView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: Constants.Main.basicLeading).isActive = true
        textFieldsView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: Constants.Main.basicTrailing).isActive = true
        textFieldsView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                               constant: Constants.TextFields.bottom).isActive = true
    }
    
    private func passNoteStructure() {
        textFieldsView.noteCreationAction = { [weak self] noteStructure in
            guard let self = self else { return }
            self.notesViewDelegate?.saveNote(note: noteStructure)
        }
    }
    
    private func changeAppTheme() {
        customSwitcher.changeTheme = { [weak self] themeMode in
            guard let self = self else { return }
            switch themeMode {
            case .light:
                self.overrideUserInterfaceStyle = .light
            case .dark:
                self.overrideUserInterfaceStyle = .dark
            }
        }
    }
}
