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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = #colorLiteral(red: 0.9921879172, green: 0.9921873212, blue: 0.9760842919, alpha: 1)
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        
        let backBarButton = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
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
