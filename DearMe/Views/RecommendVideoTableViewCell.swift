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
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "PostImagePicker")
        return imageView
    }()
    
    var videoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "HIHIHHIHI"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    var videoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "조회소 1214124"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 18)
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
            thumbNailImageView.heightAnchor.constraint(equalTo: thumbNailImageView.widthAnchor, multiplier: 0.6),
            thumbNailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            thumbNailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbNailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            videoTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoTitleLabel.topAnchor.constraint(equalTo: thumbNailImageView.bottomAnchor, constant: 5),
            videoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            videoDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoDescriptionLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 3),
            videoDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            videoDescriptionLabel.leadingAnchor.constraint(equalTo: videoTitleLabel.leadingAnchor),
        ])
    }

}
