//
//  LabelWithImage.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import UIKit

class LabelWithImage: UIView {
    private enum Constants {
        static let radius: CGFloat = 4.0
    }
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageViewContainer: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight,
                                                          .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = Constants.radius
    }
    
    func configure(with model: LabelWithImageUIModel) {
        valueLabel.text = model.value
        
        if let path = model.path {
            imageView.image = UIImage(named: path)
        }
        else {
            imageViewContainer.isHidden = true
        }
    }
    
}
