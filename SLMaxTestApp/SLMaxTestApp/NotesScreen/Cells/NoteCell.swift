//
//  NoteCell.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

final class NoteCell: UITableViewCell {
    
    static let reuseIdentifier = "NoteCell"
    
    private lazy var cellBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.Note.cornerRadius
        view.layer.borderColor = Colors.Note.cellBorder
        view.layer.borderWidth = Constants.Main.borderWidth
        view.backgroundColor = Colors.Note.background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Note.noteTitle
        label.textColor = Colors.Note.mainColor
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Note.mainColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Note.noteShortDescription
        label.textColor = Colors.Note.mainColor
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.Note.mainColor
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(cellBackground)
        cellBackground.addSubview(titleLabel)
        cellBackground.addSubview(separatorView)
        cellBackground.addSubview(shortDescriptionLabel)
        cellBackground.addSubview(chevronImageView)
    }
    
    private func setConstraints() {
        cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: Constants.Note.bottomSpacing).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: cellBackground.topAnchor,
                                        constant: Constants.Note.titleTop).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor,
                                            constant: Constants.Note.titleLeading).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor,
                                             constant: Constants.Note.titleTrailing).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: cellBackground.bottomAnchor,
                                           constant: Constants.Note.titleBottom).isActive = true
        
        separatorView.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor,
                                               constant: Constants.Note.separatorLeading).isActive = true
        separatorView.centerYAnchor.constraint(equalTo: cellBackground.centerYAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: Constants.Note.separatorWidth).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: Constants.Note.separatorHeight).isActive = true
        
        shortDescriptionLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor,
                                                       constant: Constants.Note.shortDescriptionLeading).isActive = true
        shortDescriptionLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor,
                                                        constant: Constants.Note.shortDescriptionTrailing).isActive = true
        shortDescriptionLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        chevronImageView.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor,
                                                   constant: Constants.Note.arrowTrailing).isActive = true
        chevronImageView.widthAnchor.constraint(equalToConstant: Constants.Note.arrowWidth).isActive = true
        chevronImageView.heightAnchor.constraint(equalToConstant: Constants.Note.arrowHeight).isActive = true
        chevronImageView.centerYAnchor.constraint(equalTo: cellBackground.centerYAnchor,
                                                  constant: Constants.Note.arrowCenterYOffset).isActive = true
    }
    
    func setupCell(note: NoteStructure) {
        titleLabel.text = note.title
        if note.description.count <= 20 {
            shortDescriptionLabel.text = note.description
        } else {
            shortDescriptionLabel.text = note.description.prefix(20) + Contents.Note.threeDots
        }
        chevronImageView.image = note.isExpanded ? Images.Icons.chevronUp : Images.Icons.chevronDown
    }
}
