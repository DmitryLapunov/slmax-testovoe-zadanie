//
//  DescriptionCell.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import UIKit

final class DescriptionCell: UITableViewCell {
    
    static let reuseIdentifier = "DescriptionCell"
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Note.noteDate
        label.textColor = Colors.Note.date
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Note.noteDescription
        label.textColor = Colors.Note.mainColor
        label.numberOfLines = Constants.Label.infiniteLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Note.horizontalSeparator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = Colors.Main.clear
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separatorView)
    }
    
    private func setConstraints() {
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                            constant: Constants.Description.dateTrailing).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                              constant: Constants.Description.descriptionTop).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: Constants.Description.descriptionLeading).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: Constants.Description.descriptionTrailing).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: Constants.Description.descriptionBottom).isActive = true
        
        separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: Constants.Description.separatorBottom).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: Constants.Description.separatorHeight).isActive = true
    }
    
    func setupCell(note: NoteStructure) {
        dateLabel.text = note.date
        descriptionLabel.text = note.description
    }
}
