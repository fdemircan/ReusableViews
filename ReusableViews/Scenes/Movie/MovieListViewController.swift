//
//  MovieListViewController.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import UIKit

class MovieListViewController: UIViewController, OOSAndStockDaySelectionViewModelDelegate {
    private enum Constants {
        static let height: CGFloat = 280
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
    
    func registerCell() {
        collectionView.register(cellType: BasicInfoCardViewCollectionViewCell.self)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }

}

extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: BasicInfoCardViewCollectionViewCell.self,
                                            indexPath: indexPath)
       
        guard let movie = viewModel?.movies[indexPath.item] else {
            return .init()
        }
        
        let model = BasicInfoCardViewUIModel(
            image: movie.path,
            basicTitleViewModel: BasicTitleViewUIModel(title: movie.title, subtitle: movie.desc),
            labelWithImageModel: LabelWithImageUIModel(path: "starIcon", value: movie.imdbPoint),
            labelWithoutImageModel: LabelWithImageUIModel(path: nil, value: movie.year))
      
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.height)
    }
}
