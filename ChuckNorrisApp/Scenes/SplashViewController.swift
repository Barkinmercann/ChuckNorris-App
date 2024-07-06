//
//  SplashViewController.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 6.07.2024.
//

import Foundation
import Lottie
import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        setupCosmetics()
        print("[splash]loaded")
    }
    
    func setupCosmetics() {
        
        startButton.layer.cornerRadius = 5
        
        animationView.loopMode = .loop
        animationView.play()

    }

    @IBAction func startButton(_ sender: Any) {
        self.performSegue(withIdentifier: "enterTheApp", sender: self)
    }
    
    
    
    
}
