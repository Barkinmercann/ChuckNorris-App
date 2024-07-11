//
//  CategoryTableViewCell.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 5.07.2024.
//

import Foundation
import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier: String = "categoryCell"
        
    @IBOutlet weak var categoriesTextLabel: UILabel!
    
    public func configureCell(text: String) {
        categoriesTextLabel.text = text
    }
    
}
