//
//  TextFieldsView.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

class TextFieldsView: UIView {
    
    private lazy var textFieldToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: Contents.Main.keyboardDoneButton,
                                         style: .done,
                                         target: self,
                                         action: #selector(doneTyping))
        toolbar.items = [doneButton]
        return toolbar
    }()
    
    private lazy var titleField: UITextField = {
        let textField = UITextField()
        textField.inputAccessoryView = textFieldToolbar
        textField.textColor = Colors.Note.mainColor
        textField.font = Fonts.Note.noteTitle
        textField.attributedPlaceholder = NSAttributedString(string: Contents.Note.noteTitle,
                                                             attributes: [
                                                                .foregroundColor : Colors.Note.mainColor,
                                                                .font : Fonts.Note.noteTitle as Any
                                                             ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Note.horizontalSeparator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionField: UITextField = {
        let textField = UITextField()
        textField.inputAccessoryView = textFieldToolbar
        textField.textColor = Colors.Note.mainColor
        textField.font = Fonts.Note.noteDescription
        textField.attributedPlaceholder = NSAttributedString(string: Contents.Note.noteDescription,
                                                             attributes: [
                                                                .foregroundColor : Colors.Note.mainColor,
                                                                .font : Fonts.Note.noteDescription as Any
                                                             ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(postButtonAction),
                         for: .primaryActionTriggered)
        button.setAttributedTitle(NSAttributedString(string: Contents.Main.chevronRight,
                                                     attributes: [
                                                        .foregroundColor : Colors.Note.mainColor,
                                                        .font : Fonts.Main.chevron as Any
                                                     ]),
                                  for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.layer.borderColor = Colors.Note.noteAddBorder.cgColor
    }
    
    private func setupView() {
        self.backgroundColor = Colors.Main.background
        self.layer.cornerRadius = Constants.TextFields.cornerRadius
        self.layer.borderColor = Colors.Note.noteAddBorder.cgColor
        self.layer.borderWidth = Constants.Main.borderWidth
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addSubview(titleField)
        addSubview(separatorView)
        addSubview(descriptionField)
        addSubview(postButton)
    }
    
    private func setConstraints() {
        titleField.topAnchor.constraint(equalTo: self.topAnchor,
                                        constant: Constants.TextFields.titleFieldTop).isActive = true
        titleField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                            constant: Constants.TextFields.titleFieldLeading).isActive = true
        titleField.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                             constant: Constants.TextFields.titleFieldTrailing).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: titleField.bottomAnchor,
                                           constant: Constants.TextFields.separatorTop).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                               constant: Constants.TextFields.separatorLeading).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: Constants.TextFields.separatorTrailing).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: Constants.TextFields.separatorHeight).isActive = true
        
        descriptionField.topAnchor.constraint(equalTo: separatorView.bottomAnchor,
                                              constant: Constants.TextFields.descriptionTop).isActive = true
        descriptionField.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                  constant: Constants.TextFields.descriptionLeading).isActive = true
        descriptionField.trailingAnchor.constraint(equalTo: postButton.leadingAnchor,
                                                   constant: Constants.TextFields.descriptionTrailing).isActive = true
        descriptionField.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                 constant: Constants.TextFields.descriptionBottom).isActive = true
        
        postButton.centerYAnchor.constraint(equalTo: descriptionField.centerYAnchor).isActive = true
        postButton.widthAnchor.constraint(equalToConstant: Constants.TextFields.buttonWidth).isActive = true
        postButton.heightAnchor.constraint(equalToConstant: Constants.TextFields.buttonHeight).isActive = true
        postButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                             constant: Constants.TextFields.buttonTrailing).isActive = true
    }
    
    @objc private func postButtonAction() {
        
    }
    
    @objc private func doneTyping() {
        self.endEditing(true)
    }
}
