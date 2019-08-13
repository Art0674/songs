//
//  SongDownloader.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class SongDownloader: IconDownloader {
   
    private var progressClosure: ((Float) -> Void)?
    private var task: URLSessionDownloadTask?

    func downloadSongPreview(with url: URL, progress progressClosure:@escaping (Float) -> Void, completion completionClosure: @escaping (URL?) -> Void) {
        self.progressClosure = progressClosure
        self.completionClosure = completionClosure
        task = session.downloadTask(with: url)
        task?.resume()
    }

    func pause() {
        task?.suspend()
    }

    func resume() {
        task?.resume()
    }

    func cancel() {
        task?.cancel()
    }

    // MARK: URLSessionDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        if totalBytesExpectedToWrite > 0 {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            progressClosure?(progress)
        } else {
            progressClosure?(1)
        }
    }
}
