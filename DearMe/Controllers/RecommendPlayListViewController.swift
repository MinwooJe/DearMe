//
//  RecommendPlayListViewController.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import UIKit

final class RecommendPlayListViewController: UIViewController {
    
    private let recommendTableView = UITableView()
    
    private var recommendedVideoArray: [Item] = []
    
    private let dataManager = NetworkManager.shared

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchData()
    }
    
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
        //        recommendedVideoArray =  datamanager.fetchMovieData()
        self.recommendedVideoArray = []
        
        dataManager.fetchVideo(searchTerm: "신나는 플리") { result in
            switch result {
            case .success(let videoDatas):
                self.recommendedVideoArray = videoDatas
                DispatchQueue.main.async {
                    self.recommendTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: Implement TableView DataSource

extension RecommendPlayListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendedVideoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! RecommendVideoTableViewCell
        
        cell.imageUrl = recommendedVideoArray[indexPath.row].snippet.thumbnails.high.url
        cell.videoTitleLabel.text = recommendedVideoArray[indexPath.row].snippet.title
        cell.videoDescriptionLabel.text = recommendedVideoArray[indexPath.row].snippet.channelTitle

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
