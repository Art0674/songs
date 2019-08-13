//
//  SongTableViewCell.swift
//  songs
//
//  Created by Arthur Hakobyan on 8/9/19.
//  Copyright © 2019 Arhur Hakobyan. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var artworkImageView: UIImageView!
    @IBOutlet private weak var trackLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var progressSlider: UIProgressView!
    @IBOutlet private weak var downloadButton: UIButton!
    @IBOutlet private weak var pauseButton: UIButton!
    @IBOutlet private weak var resumeButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!

    func setup(with viewModel: SongViewModel) {
        trackLabel.text = viewModel.trackName
        artistLabel.text = viewModel.artistName
        viewModel.getArtwork { [weak self] image in
            DispatchQueue.main.async {
                self?.artworkImageView.image = image
            }
        }
    }
    
    @IBAction private func donwloadAction() {
        downloadButton.isHidden = true
        pauseButton.isHidden = false
        cancelButton.isHidden = false
        // TODO: Art
    }
    
    @IBAction private func pauseAction() {
        pauseButton.isHidden = true
        resumeButton.isHidden = false
        // TODO: Art
    }
    
    @IBAction private func resumeAction() {
        resumeButton.isHidden = true
        pauseButton.isHidden = false
        // TODO: Art
    }
    
    @IBAction private func cancelAction() {
        pauseButton.isHidden = true
        cancelButton.isHidden = true
        downloadButton.isHidden = false
        // TODO: Art
    }
}
