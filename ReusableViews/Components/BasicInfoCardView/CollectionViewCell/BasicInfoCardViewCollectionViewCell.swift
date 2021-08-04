//
//  BasicInfoCardViewCollectionViewCell.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import UIKit

class BasicInfoCardViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var basicInfoCardView: BasicInfoCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: BasicInfoCardViewUIModel?) {
        basicInfoCardView.configure(with: model)
    }
}
