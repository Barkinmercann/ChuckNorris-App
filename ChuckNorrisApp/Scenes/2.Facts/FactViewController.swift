//
//  ViewController.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 4.07.2024.
//

import UIKit

class FactViewController: UIViewController {
    
    var selectedCategory: String?
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let category = selectedCategory {
            title = category.capitalized
            getRandomFact(from: category)
        }
    }
    
    func getRandomFact(from category: String) {
        NetworkManager.shared.getRandomFact(from: category) { fact, error in
                if let fact = fact {
                    self.textLabel.text = fact.value
                } else if let error = error {
                    let alert = UIAlertController(title: "Error",
                                                  message: error,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
            }
    }
    
    @IBAction func getRandomFact(_ sender: UIButton) {
        if let category = selectedCategory {
                   getRandomFact(from: category)
        }
    }
}
