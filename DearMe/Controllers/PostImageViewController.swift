//
//  PostImageViewController.swift
//  DearMe
//
//  Created by 제민우 on 11/17/23.
//

import UIKit

class PostImageViewController: UIViewController {
    
    let v = PostImageView()
    
    override func loadView() {
        view = v
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
