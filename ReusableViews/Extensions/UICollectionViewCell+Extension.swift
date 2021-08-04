//
//  UICollectionViewCell+Extension.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 4.08.2021.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
