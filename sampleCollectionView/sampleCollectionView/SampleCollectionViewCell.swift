//
//  SampleCollectionViewCell.swift
//  sampleCollectionView
//
//  Created by 舘佳紀 on 2020/11/28.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    func setupCell(model : Model) {
        subjectLabel.text = model.title
        contentLabel.text = model.context
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
