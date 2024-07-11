//
//  CategoryTableViewCell.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 11.07.2024.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    static let identifier: String = "categoryCell"
        
    @IBOutlet weak var categoryTextLabel: UILabel!
    
    public func configureCell(text: String) {
        categoryTextLabel.text = text
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
