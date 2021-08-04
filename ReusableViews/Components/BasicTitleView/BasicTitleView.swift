//
//  BasicTitleView.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import UIKit

class BasicTitleView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
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
    }
    
    func configure(with model: BasicTitleViewUIModel) {
        titleLabel.text = model.title
        
        if let subtitle = model.subtitle {
            subtitleLabel.text = subtitle
        }
        else {
            subtitleLabel.isHidden = true
        }
    }
}
