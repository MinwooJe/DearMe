//
//  RecommendVideoTableViewCell.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import UIKit

class RecommendVideoTableViewCell: UITableViewCell {
    
    let thumbNailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "PostImagePicker")
        return imageView
    }()
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "HIHIHHIHI"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    let videoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "조회소 1214124"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

// MARK: Configure Layout

extension RecommendVideoTableViewCell {
    
    private func configureSubViews() {
        [thumbNailImageView, videoTitleLabel, videoDescriptionLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let contentView = self.contentView
        NSLayoutConstraint.activate([
            thumbNailImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            thumbNailImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            thumbNailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            thumbNailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            videoTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoTitleLabel.topAnchor.constraint(equalTo: thumbNailImageView.topAnchor, constant: 5),
            videoTitleLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            videoDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoDescriptionLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 3),
            videoDescriptionLabel.leadingAnchor.constraint(equalTo: videoTitleLabel.leadingAnchor),
        ])
    }

}
