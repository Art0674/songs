//
//  Result.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class Result: Codable {
    let resultCount: Int
    let results: [Song]
}

class ResultDecoder {
    class func decode(data: Data) -> Result? {
        guard let result = try? JSONDecoder().decode(Result.self, from: data) else { return nil }
        return result
    }
}
