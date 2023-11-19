//
//  RecommendPlayListViewController.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import UIKit

final class RecommendPlayListViewController: UIViewController {
    
    private let recommendTableView = UITableView()
    
    private var recommendedVideoArray: [DummyModel] = []
    
    private let datamanager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialSetting()
        fetchData()
        configureSubViews()
        configureLayout()
    }
}

// MARK: Configure Initial Setting
extension RecommendPlayListViewController {
    
    private func configureInitialSetting() {
        recommendTableView.dataSource = self
//        recommendTableView.delegate = self
        recommendTableView.estimatedRowHeight = 300
        recommendTableView.register(RecommendVideoTableViewCell.self, forCellReuseIdentifier: "VideoCell")
    }
    
    private func fetchData() {
        recommendedVideoArray = datamanager.fetchMovieData()
    }
    
}

// MARK: Implement TableView DataSource

extension RecommendPlayListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendedVideoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! RecommendVideoTableViewCell
        
        cell.thumbNailImageView.image = recommendedVideoArray[indexPath.row].videoImage
        cell.videoTitleLabel.text = recommendedVideoArray[indexPath.row].videoTitle
        cell.videoDescriptionLabel.text = recommendedVideoArray[indexPath.row].videoDescription
//        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

// MARK: Configure Layout

extension RecommendPlayListViewController {
    
    private func configureSubViews() {
        view.addSubview(recommendTableView)
        recommendTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            recommendTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recommendTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            recommendTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            recommendTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
        
    }
}
