//
//  SongViewModel.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/11/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class SongViewModel {
    
    private var song: Song
    private var artwork: UIImage?
    
    private var iconDownloader = IconDownloader()
    private var songDownloader = SongDownloader()
    
    init(song: Song) {
        self.song = song
    }
    
    var trackName: String {
        return song.trackName
    }
    
    var artistName: String {
        return song.artistName
    }
    
    func getArtwork(completion: @escaping (UIImage?) -> Void) {
        if let artwork = artwork {
            completion(artwork)
            return
        }
        iconDownloader.downloadSongArtwork(with: song.artworkUrl100) { [weak self] resultURL in
            guard let url = resultURL, let data = try? Data(contentsOf: url) else { completion(nil); return }
            let image = UIImage(data: data)
            self?.artwork = image
            completion(image)
        }
    }
}
