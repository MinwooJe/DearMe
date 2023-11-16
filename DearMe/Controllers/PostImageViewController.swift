//
//  PostImageViewController.swift
//  DearMe
//
//  Created by 제민우 on 11/17/23.
//

import UIKit
import PhotosUI

final class PostImageViewController: UIViewController {
    
    let postImageView = PostImageView()
    
    override func loadView() {
        view = postImageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.configureTapPostImageAction(self, #selector(configureSelectImageAlert))
    }
}

// MARK: Configure ActionSheet

extension PostImageViewController {
    
    @objc private func configureSelectImageAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "앨범", style: .default) { (action)
            in self.openLibrary()
        }
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
                
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Configure PHPicker

extension PostImageViewController: PHPickerViewControllerDelegate {
    
    private func openLibrary() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images])
        
        let phPickerVC = PHPickerViewController(configuration: configuration)
        phPickerVC.delegate = self
        self.present(phPickerVC, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        results.forEach { result in
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.postImageView.cameraImageView.image = image
                        }
                    }
                    if let error = error {
                        print("에러")
                    }
                }
            }
        }
        dismiss(animated: true)
    }
}

// MARK: Configure ImagePicker

extension PostImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let addPostImagePicker = UIImagePickerController()
            
            addPostImagePicker.sourceType = .camera
            addPostImagePicker.delegate = self
            present(addPostImagePicker, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            postImageView.cameraImageView.image = image
            dismiss(animated: true)
        }
    }
}
