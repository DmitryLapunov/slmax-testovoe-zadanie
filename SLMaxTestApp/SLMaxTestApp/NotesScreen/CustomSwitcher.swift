//
//  CustomSwitcher.swift
//  SLMaxTestApp
//
//  Created by Дмитрий Лапунов on 6.12.22.
//

import UIKit

enum ThemeMode {
    case light
    case dark
}

final class CustomSwitcher: UIView {
    
    private var toggleViewLeadingAnchor = NSLayoutConstraint()
    var changeTheme: ((ThemeMode) -> Void)?
    
    private lazy var switcherBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.ThemeSwitcher.backgroundCorner
        view.backgroundColor = Colors.ThemeSwitcher.background
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var toggleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.ThemeSwitcher.toggleCorner
        view.backgroundColor = Colors.ThemeSwitcher.highlight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lightModeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Icons.lightTheme
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var darkModeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.Icons.darkTheme
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setConstraints()
        configureGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.backgroundColor = Colors.Main.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addSubview(switcherBackgroundView)
        addSubview(toggleView)
        addSubview(lightModeImageView)
        addSubview(darkModeImageView)
    }
    
    private func setConstraints() {
        switcherBackgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        switcherBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        switcherBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        switcherBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        toggleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        toggleView.widthAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.toggleSize).isActive = true
        toggleView.heightAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.toggleSize).isActive = true
        toggleViewLeadingAnchor = toggleView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                      constant: Constants.ThemeSwitcher.toggleLeading)
        toggleViewLeadingAnchor.isActive = true
        
        lightModeImageView.widthAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.lightModeSize).isActive = true
        lightModeImageView.heightAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.lightModeSize).isActive = true
        lightModeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lightModeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                    constant: Constants.ThemeSwitcher.lightModeLeading).isActive = true
        
        darkModeImageView.widthAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.darkModeSize).isActive = true
        darkModeImageView.heightAnchor.constraint(equalToConstant: Constants.ThemeSwitcher.darkModeSize).isActive = true
        darkModeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        darkModeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                    constant: Constants.ThemeSwitcher.darkModeTrailing).isActive = true
    }
    
    private func configureGesture() {
        toggleView.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(switcherTapped(_:)))
        toggleView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func switcherTapped(_ sender: UITapGestureRecognizer) {
        if traitCollection.userInterfaceStyle == .light {
            toggleViewLeadingAnchor.constant = Constants.ThemeSwitcher.toggleLeadingIncreased
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.layoutIfNeeded()
            }
            changeTheme?(.dark)
        } else {
            toggleViewLeadingAnchor.constant = Constants.ThemeSwitcher.toggleLeading
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                self.layoutIfNeeded()
            }
            changeTheme?(.light)
        }
    }
}
