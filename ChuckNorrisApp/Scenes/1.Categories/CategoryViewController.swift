//
//  CategoryTableViewController.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 5.07.2024.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController {
    
    var categoriesArray: [String]?
    var selectedCategory: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager.shared.getCategories { categories, error in
            if let temp = categories {
                self.categoriesArray = temp
            } else if let error {
                let alert = UIAlertController(title: "Error",
                                              message: error,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                
                self.present(alert, animated: true)
            }
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FactViewController {
            destinationVC.selectedCategory = selectedCategory
        }
    }
}
//MARK: - TableView Extension
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier,
                                                               for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
        
        if let text = categoriesArray?[indexPath.row].capitalized {
            categoryCell.configureCell(text: text)
        }
        return categoryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categoriesArray?[indexPath.row]
        performSegue(withIdentifier: AppConstants.Segue.categoriesToSelectedCategory, sender: nil)
    }
}
