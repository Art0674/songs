//
//  IconDownloader.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class IconDownloader: NSObject, URLSessionDownloadDelegate {
    
    var completionClosure: ((URL?) -> Void)?
    
    lazy var session: URLSession = {
        URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.current)
    }()
    
    func downloadSongArtwork(with url: URL, completion completionClosure: @escaping (URL?) -> Void) {
        self.completionClosure = completionClosure
        session.downloadTask(with: url).resume()
    }
    
    // MARK: URLSessionDelegate
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        completionClosure?(location)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        completionClosure?(nil)
    }
}
