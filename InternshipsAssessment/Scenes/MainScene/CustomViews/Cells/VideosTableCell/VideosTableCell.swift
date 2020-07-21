//
//  VideosTableCell.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import UIKit

class VideosTableCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func configure(videoViewModel: VideoViewModel) {
        self.titleLabel.text = videoViewModel.title
        self.channelLabel.text = videoViewModel.channel
    }
    
    private func setupCell() {
        self.thumbnailView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
