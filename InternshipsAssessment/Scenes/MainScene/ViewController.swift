//
//  ViewController.swift
//  InternshipsAssessment
//
//  Created by Sherif M. Eldeeb on 7/20/20.
//  Copyright © 2020 Sherif Eldeeb. All rights reserved.
//

import UIKit
import DailymotionPlayerSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: DMPlayerViewControllerDelegate {
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

