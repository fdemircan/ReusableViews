//
//  MovieListViewModel.swift
//  ReusableViews
//
//  Created by Fetiye Demircan on 3.08.2021.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: OOSAndStockDaySelectionViewModelDelegate? { get set }
    var movies: [Movie] { get }
    var numberOfItems: Int { get }
    func load()
}

protocol OOSAndStockDaySelectionViewModelDelegate: AnyObject {
    func registerCell()
    func reloadData()
}

class MovieListViewModel: MovieListViewModelProtocol {
    weak var delegate: OOSAndStockDaySelectionViewModelDelegate?
    
    var movies: [Movie] {
        createMovies()
    }
    
    var numberOfItems: Int {
        movies.count
    }
    
    func load() {
        delegate?.registerCell()
        delegate?.reloadData()
    }
    
    private func createMovies() -> [Movie] {
        var movies = [Movie]()
        
        let movie1 = Movie(title: "The Shawshank Redemption",
                           desc: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                           year: "1994",
                           imdbPoint: "9.2",
                           path: "joker")
        
        let movie2 = Movie(title: "The Godfather",
                           desc: "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.",
                           year: "1972",
                           imdbPoint: "9.1",
                           path: "godfather")
        
        let movie3 = Movie(title: "The Godfather: Part II",
                           desc: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
                           year: "1974",
                           imdbPoint: "9",
                           path: "godfather2")
        
        let movie4 = Movie(title: "The Dark Knight",
                           desc: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                           year: "2008",
                           imdbPoint: "9",
                           path: "batman")
        
        let movie5 = Movie(title: "12 Angry Men",
                           desc: "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.",
                           year: "1957",
                           imdbPoint: "8.9",
                           path: "12angrymen")
        movies = [movie1, movie2, movie3, movie4, movie5]
        
        return movies
    }
    
}

