//
//  SongListDownloader.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

let host = "https://itunes.apple.com"
let search = host + "/search"
let media = "media"
let entity = "entity"
let term = "term"

class SongListDownloader {
    
    static let shared = SongListDownloader()
    
    private let session = URLSession(configuration: .default)
    
    private func addQueries(_ queries: [String: String], to baseURL: URL) -> URL {
        var components = URLComponents(string: baseURL.absoluteString)
        let queryItems = queries.map { URLQueryItem(name: $0, value: $1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)) }
        components?.queryItems = queryItems
        return components?.url ?? baseURL
    }
    
    func requestSongs(_ name: String, completion: @escaping (Data?) -> Void) {
        guard var url = URL(string: search) else { print("no url", search); return }
        let queries: [String: String] = [media: "music", entity: "song", term: name]
        url = addQueries(queries, to: url)
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else { completion(nil); return }
            completion(data)
        }
        task.resume()
    }
}
