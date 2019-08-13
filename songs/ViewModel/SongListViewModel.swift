//
//  SongListViewModel.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class SongListViewModel {
    
    var songs = [SongViewModel]()
    
    func getSongs(for name: String, with completion: @escaping (Bool) -> Void) {
        SongListDownloader.shared.requestSongs(name) { [weak self] data in
            if let data = data, let result = ResultDecoder.decode(data: data) {
                self?.songs = result.results.map { SongViewModel(song: $0) }
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
