//
//  Song.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class Song: Codable {
    let trackName: String
    let artistName: String
    let artworkUrl100: URL
    let previewUrl: URL
}
