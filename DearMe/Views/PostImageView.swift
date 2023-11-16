//
//  PostImageView.swift
//  DearMe
//
//  Created by 제민우 on 11/17/23.
//

import UIKit

final class PostImageView: UIView {
    
    let cameraImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "PostImagePicker")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "당신의 기분을 알려주세요"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
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

// MARK: GestureRecognizer Delegate Implement

extension PostImageView: UIGestureRecognizerDelegate {
    
    func configureTapPostImageAction(_ target: Any, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.delegate = self
        cameraImageView.isUserInteractionEnabled = true
        cameraImageView.addGestureRecognizer(tapGesture)
    }
}

// MARK: Configure Layout

extension PostImageView {
    
    private func configureSubViews() {
        [cameraImageView, descriptionLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: Configure cameraContainerView Layout
            cameraImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            cameraImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cameraImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 15)
        ])
    }
}
