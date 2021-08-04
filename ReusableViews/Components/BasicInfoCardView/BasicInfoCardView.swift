//
//  BasicInfoCardView.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import UIKit

class BasicInfoCardView: UIView {
    private enum Constants {
        static let borderWidth: CGFloat = 1
    }
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelWithImageView: LabelWithImage!
    @IBOutlet private weak var infoView: BasicTitleView!
    @IBOutlet private weak var labelWithoutImageView: LabelWithImage!
    
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
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func configure(with model: BasicInfoCardViewUIModel?) {
        guard let model = model else { return }
        
        imageView.image = UIImage(named: model.image)
        labelWithImageView.configure(with: model.labelWithImageModel)
        infoView.configure(with: model.basicTitleViewModel)
        labelWithoutImageView.configure(with: model.labelWithoutImageModel)
    }
}
