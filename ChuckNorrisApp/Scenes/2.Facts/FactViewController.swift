//
//  ViewController.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 4.07.2024.
//

import UIKit

class FactViewController: UIViewController {
    
    var selectedCategory: String?
    
    var lastFact: ChuckNorrisFact?
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getSavedFact()
        if let category = selectedCategory {
            title = category.capitalized
        }
    }
    func getSavedFact() {
        if let factID = UserManager.shared.lastSavedFactID {
            NetworkManager.shared.getFact(from: factID) { fact, error in
                if let category = self.selectedCategory,
                   fact?.categories?.contains(category) == true {
                    self.handleResponse(fact, error)
                } else {
                    self.getRandomFact()
                }
            }
        } else {
            self.getRandomFact()
        }
    }
    
    func getRandomFact() {
        if let category = self.selectedCategory {
            NetworkManager.shared.getRandomFact(from: category) { fact, error in
                self.lastFact = fact
                self.handleResponse(fact, error)
            }
        } else {
            showErrorAlert("Cannot find a category!")
        }
    }
    
    func handleResponse(_ fact: ChuckNorrisFact?, _ error: String?) {
        if let fact = fact {
            textLabel.text = fact.value
        } else if let error = error {
            showErrorAlert(error)
        }
    }
    
    func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func getRandomFact(_ sender: UIButton) {
        if let category = selectedCategory {
            getRandomFact()
        }
    }
    
    @IBAction func saveFactPressed(_ sender: UIButton) {
        UserManager.shared.lastSavedFactID = lastFact?.id
    }
    
}
