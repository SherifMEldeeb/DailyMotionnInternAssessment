//
//  ViewController.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/20/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import UIKit
import DailymotionPlayerSDK

class MainSceneController: UIViewController {
    private var customView: MainSceneView {
        return view as! MainSceneView
    }
    private var videosListViewModel: VideosListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.videosTableView.delegate = self
        self.customView.videosTableView.dataSource = self

        self.videosListViewModel = VideosListViewModel(videosRepository: VideosRepository.create(isConnected: true)) { [weak self] error in
            guard let self = self else { return }
            if let err = error {
                UIAlertController.Builder()
                    .addAction(with: "OK", style: .default, handler: nil)
                    .withTitle("Something Went Wrong")
                    .withMessage(err.localizedDescription)
                    .show(in: self)
                return
            }
            self.customView.videosTableView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.customView.videosTableView.delegate = nil
        self.customView.videosTableView.dataSource = nil
    }

}

extension MainSceneController: DMPlayerViewControllerDelegate {
    func player(_ player: DMPlayerViewController, didReceiveEvent event: PlayerEvent) {
        
    }
    
    func player(_ player: DMPlayerViewController, openUrl url: URL) {
        
    }
    
    func playerDidInitialize(_ player: DMPlayerViewController) {
        
    }
    
    func player(_ player: DMPlayerViewController, didFailToInitializeWithError error: Error) {
        
    }
    
}

extension MainSceneController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videosListViewModel?.videosViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideosTableCell.className, for: indexPath) as! VideosTableCell
        if let video = self.videosListViewModel?.videosViewModel?[indexPath.row] {
            cell.configure(videoViewModel: video)
        }else {
            cell.configure(videoViewModel: VideoViewModel(Video(id: "000", title: "title", channel: "channel", owner: "owner")))
        }
        return cell
    }
    
    
    
    
}

