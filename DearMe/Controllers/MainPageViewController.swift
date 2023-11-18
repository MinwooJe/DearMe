//
//  MainPageViewController.swift
//  DearMe
//
//  Created by 제민우 on 11/17/23.
//

import UIKit

final class MainPageViewController: UIViewController {

    private let mainPageView = MainPageView()

    override func loadView() {
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIntialSetting()
        configureAddTarget()
    }
}

extension MainPageViewController {
    private func configureIntialSetting() {
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationItem.backBarButtonItem = backBarButton
    }
}

extension MainPageViewController {
    private func configureAddTarget() {
        mainPageView.findButton.addTarget(self, action: #selector(didTapFindButton), for: .touchUpInside)
    }
    
    @objc private func didTapFindButton() {
        let postImageVC = PostImageViewController()
        navigationController?.pushViewController(postImageVC, animated: true)
    }
}
