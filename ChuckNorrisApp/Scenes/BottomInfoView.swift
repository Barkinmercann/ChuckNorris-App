//
//  BottomInfoView.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 11.07.2024.
//

import UIKit

class BottomInfoView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bottomInfoLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BottomInfoView", owner: self)
        addSubview(contentView)
        contentView.frame = bounds
    }
}
