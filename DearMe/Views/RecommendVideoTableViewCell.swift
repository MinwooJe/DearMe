//
//  RecommendVideoTableViewCell.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import UIKit

class RecommendVideoTableViewCell: UITableViewCell {
    
    // 이미지 URL을 전달받는 속성
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
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
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    var videoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "조회소 1214124"
        label.textColor = .systemGray2
        label.font = UIFont.systemFont(ofSize: 16)
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
    
    // 셀이 재사용되기 전에 호출되는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        // 일반적으로 이미지가 바뀌는 것처럼 보이는 현상을 없애기 위해서 실행 ⭐️
        self.thumbNailImageView.image = nil
    }
}

// MARK: Networking

extension RecommendVideoTableViewCell {
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        
        // 오래걸리는 작업을 동시성 처리 (다른 쓰레드에서 일시킴)
        DispatchQueue.global().async {
            // URL을 가지고 데이터를 만드는 메서드 (오래걸리는데 동기적인 실행)
            // (일반적으로 이미지를 가져올때 많이 사용)
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            guard self.imageUrl! == url.absoluteString else { return }
            
            // 작업의 결과물을 이미로 표시 (메인큐)
            DispatchQueue.main.async {
                self.thumbNailImageView.image = UIImage(data: data)
            }
        }
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
            thumbNailImageView.heightAnchor.constraint(equalTo: thumbNailImageView.widthAnchor, multiplier: 0.55),
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
