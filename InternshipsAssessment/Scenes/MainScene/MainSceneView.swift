//
//  MainSceneView.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/21/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import UIKit

class MainSceneView: UIView {

    @IBOutlet weak var videoContainer: UIView!
    @IBOutlet weak var videosTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    
    fileprivate func SetupView() {
        videosTableView.register(UINib(nibName: VideosTableCell.className, bundle: nil), forCellReuseIdentifier: VideosTableCell.className)
    }
}
