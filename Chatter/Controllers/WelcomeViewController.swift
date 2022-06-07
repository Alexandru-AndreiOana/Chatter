//
//  WelcomeViewController.swift
//  Chatter
//
//  Created by Alexandru Oana on 07.06.2022.
//



import UIKit
import GhostTypewriter

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: TypewriterLabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }
     
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.typingTimeInterval = 0.15
        titleLabel.startTypewritingAnimation()
    }
    

}
