//
//  NetworkManager.swift
//  DearMe
//
//  Created by 제민우 on 11/19/23.
//

import Foundation

enum NetworkError:Error {
    case networkingError
    case dataError
    case parseError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    typealias NetworkCompletion = (Result<[Item], NetworkError>) -> Void
    
    func fetchVideo(searchTerm: String, completion: @escaping NetworkCompletion) {
        
        // URL 인코딩
        guard let encodedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(.dataError))
            return
        }
        
        
        let urlString = "\(VideoAPI.requestURL)&q=\(searchTerm)+\(VideoAPI.requestSetting)&\(VideoAPI.apiKey)"
        
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
             
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            // 데이터 출력하기
             if let jsonString = String(data: safeData, encoding: .utf8) {
                 print(jsonString)
             }
            
            if let videos = self.parseJson(safeData) {
                completion(.success(videos))
            } else {
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    private func parseJson(_ videofData: Data) -> [Item]? {
        
        do {
            let videoData = try JSONDecoder().decode(YouTubeResponse.self, from: videofData)
            return videoData.items
        } catch {
            // 파싱 에러 출력하기
            print("Failed to parse JSON: \(error)")
            
            print(error.localizedDescription)
            return nil
        }
    }
}
