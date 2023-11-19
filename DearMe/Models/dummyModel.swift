//
//  dummyModel.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import UIKit

struct DummyModel {
    let videoImage: UIImage
    let videoTitle: String
    let videoDescription: String
}

class DataManager {
    private var videoDataArray: [DummyModel] = [
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
        DummyModel(videoImage: UIImage(named: "PostImagePicker")!, videoTitle: "HIHIHI", videoDescription: "It's me - 조회수 3만회 - 1년전 "),
    ]
    
    func fetchMovieData() -> [DummyModel] {
        return videoDataArray
    }
    
}
