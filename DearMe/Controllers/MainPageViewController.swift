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
        view = MainPageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
