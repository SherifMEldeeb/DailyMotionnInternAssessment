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


}

extension MainSceneController: DMPlayerViewControllerDelegate {
    func player(_ player: DMPlayerViewController, didReceiveEvent event: PlayerEvent) {
        <#code#>
    }
    
    func player(_ player: DMPlayerViewController, openUrl url: URL) {
        <#code#>
    }
    
    func playerDidInitialize(_ player: DMPlayerViewController) {
        <#code#>
    }
    
    func player(_ player: DMPlayerViewController, didFailToInitializeWithError error: Error) {
        <#code#>
    }
    
}

extension MainSceneController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videosListViewModel?.videosViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideosTableCell.className, for: indexPath) as! VideosTableCell
        
        return cell
    }
    
    
}

