//
//  MainPageView.swift
//  DearMe
//
//  Created by 제민우 on 11/17/23.
//

import UIKit

final class MainPageView: UIView {
    
    let mainLabel: UILabel = {
       let mainLabel = UILabel()
        mainLabel.text = "지금 기분은 어떠신가요?"
        mainLabel.font = .systemFont(ofSize: 32, weight: .bold)
        return mainLabel
    }()
    
    let findButton: UIButton = {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 20)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.attributedTitle = AttributedString("알아보기", attributes: container)
        config.baseBackgroundColor = UIColor.systemYellow
        config.baseForegroundColor = UIColor.white
        
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Layout

extension MainPageView {
    
    private func configureSubViews() {
        [mainLabel, findButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            findButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            findButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            findButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
