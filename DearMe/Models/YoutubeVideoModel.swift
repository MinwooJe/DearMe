//
//  YoutubeVideoModel.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import Foundation

// MARK: - Welcome
struct YouTubeResponse: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let snippet: Snippet
    let id: VideoID
}

// MARK: - Snippet
struct Snippet: Codable {
    let title: String
    let channelTitle: String
    let thumbnails: Thumbnails
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: ThumbnailDefault

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct ThumbnailDefault: Codable {
    let url: String
}

// MARK: - VideoID
struct VideoID: Codable {
    let videoId: String
}
