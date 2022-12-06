//
//  NoteCell.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 5.12.22.
//

import UIKit

final class NoteCell: UITableViewCell {
    
    // MARK: - Class properties
    
    static let reuseIdentifier = "NoteCell"
    var deleteButtonShown: ((Bool) -> Void)?
    private var isDeletionRequested: Bool = false
    private var countdownTimer: Timer?
    private var timerCurrentCount = Constants.Note.timer {
        didSet {
            deleteLabel.text = timerCurrentCount == Constants.Note.timer ? Contents.Note.delete : "\(Int(timerCurrentCount))"
        }
    }
    var deleteRow: (() -> Void)?
    
    // MARK: - UI elements
    
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.backgroundColor = Colors.Note.noteDeletionBackground
        stackView.layer.cornerRadius = Constants.Note.cornerRadius
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var deleteView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cancelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Icons.cancel
        imageView.tintColor = Colors.Note.noteDeletionTint
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var deleteLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Note.noteDeletion
        label.textColor = Colors.Note.noteDeletionTint
        label.text = Contents.Note.delete
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = Colors.Main.clear
        setupSubviews()
        setConstraints()
        configureGestures()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Content setup methods
    
    private func setupSubviews() {
        contentView.addSubview(cellBackground)
        cellBackground.addSubview(titleLabel)
        cellBackground.addSubview(separatorView)
        cellBackground.addSubview(shortDescriptionLabel)
        cellBackground.addSubview(chevronImageView)
        cellBackground.addSubview(stackView)
        stackView.addArrangedSubview(deleteView)
        deleteView.addSubview(cancelImageView)
        deleteView.addSubview(deleteLabel)
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
        
        stackView.topAnchor.constraint(equalTo: cellBackground.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: cellBackground.bottomAnchor).isActive = true
        
        cancelImageView.centerYAnchor.constraint(equalTo: deleteView.centerYAnchor,
                                                 constant: Constants.Note.cancelImageYOffset).isActive = true
        cancelImageView.centerXAnchor.constraint(equalTo: deleteView.centerXAnchor).isActive = true
        cancelImageView.widthAnchor.constraint(equalToConstant: Constants.Note.cancelImageSize).isActive = true
        cancelImageView.heightAnchor.constraint(equalToConstant: Constants.Note.cancelImageSize).isActive = true
        
        deleteLabel.centerYAnchor.constraint(equalTo: deleteView.centerYAnchor).isActive = true
        deleteLabel.leadingAnchor.constraint(equalTo: deleteView.leadingAnchor,
                                             constant: Constants.Note.deleteLabelLeading).isActive = true
        deleteLabel.trailingAnchor.constraint(equalTo: deleteView.trailingAnchor,
                                              constant: Constants.Note.deleteLabelTrailing).isActive = true
    }
    
    // MARK: - Cell custom setup methods
    
    func setupCell(note: NoteStructure) {
        titleLabel.text = note.title
        if note.description.count <= Constants.Note.descriptionMaxCount {
            shortDescriptionLabel.text = note.description
        } else {
            shortDescriptionLabel.text = note.description.prefix(Constants.Note.descriptionMaxCount) + Contents.Note.threeDots
        }
        chevronImageView.image = note.isExpanded ? Images.Icons.chevronUp : Images.Icons.chevronDown
    }
    
    private func configureGestures() {
        let leftRecognizer = UISwipeGestureRecognizer(target: self,
                                                      action: #selector(swipeMade(_:)))
        leftRecognizer.direction = .left
        let rightRecognizer = UISwipeGestureRecognizer(target: self,
                                                       action: #selector(swipeMade(_:)))
        rightRecognizer.direction = .right
        contentView.addGestureRecognizer(leftRecognizer)
        contentView.addGestureRecognizer(rightRecognizer)
        
        stackView.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(deleteAction(_:)))
        stackView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func swipeMade(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            UIView.animate(withDuration: Constants.Note.animationDuration,
                           delay: Constants.Note.animationDelay,
                           options: .curveEaseIn) {
                self.deleteView.isHidden = false
            }
            deleteButtonShown?(true)
        } else if sender.direction == .right {
            UIView.animate(withDuration: Constants.Note.animationDuration,
                           delay: Constants.Note.animationDelay,
                           options: .curveEaseIn) {
                self.deleteLabel.text = Contents.Note.delete
                self.cancelImageView.isHidden = true
                self.deleteView.isHidden = true
            }
            deleteButtonShown?(false)
        }
    }
    
    @objc private func deleteAction(_ sender: UITapGestureRecognizer) {
        isDeletionRequested = !isDeletionRequested
        if isDeletionRequested {
            countdownTimer = Timer.scheduledTimer(timeInterval: Constants.Note.timeInterval,
                                                  target: self,
                                                  selector: #selector(handleTimerExecution),
                                                  userInfo: nil,
                                                  repeats: true)
            cancelImageView.isHidden = false
            deleteLabel.text = "\(Int(timerCurrentCount))"
        } else {
            countdownTimer?.invalidate()
            timerCurrentCount = Constants.Note.timer
            deleteLabel.text = Contents.Note.delete
            cancelImageView.isHidden = true
        }
    }
    
    @objc private func handleTimerExecution() {
        if timerCurrentCount == 0.0 {
            timerCurrentCount = Constants.Note.timer
            cancelImageView.isHidden = true
            deleteView.isHidden = true
            deleteButtonShown?(false)
            isDeletionRequested = false
            countdownTimer?.invalidate()
            deleteRow?()
        } else {
            timerCurrentCount -= Constants.Note.timeInterval
        }
    }
}
