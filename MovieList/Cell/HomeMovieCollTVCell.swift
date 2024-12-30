//
//  HomeMovieCollTVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class HomeMovieCollTVCell: UITableViewCell {
 
  
  
  
  @IBOutlet weak var clcAllMovie: UICollectionView!
  var presenter: VTPHomeProtocol?
  var dataAllMovie: [Title] = []
  var parentViewController: UIViewController?
  var indexNumb: Int?
  var url: String?
  
  static let identifier = "HomeMovieCollTVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCollTVCell", bundle: nil)
  }
  func configure(with dataAllMovie: [Title]) {
    self.dataAllMovie = dataAllMovie
    DispatchQueue.main.async { [weak self] in
      self?.clcAllMovie.reloadData() // Make sure this is inside the closure
    }
    func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
      clcAllMovie.register(HomeMovieCVCell.nib(), forCellWithReuseIdentifier: HomeMovieCVCell.identifier)
      clcAllMovie.delegate = self
      clcAllMovie.dataSource = self
    }
    
    func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
    }
    
  }
}
//
extension HomeMovieCollTVCell:  UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataAllMovie.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = clcAllMovie.dequeueReusableCell(withReuseIdentifier: HomeMovieCVCell.identifier, for: indexPath) as!HomeMovieCVCell
    
    let title = dataAllMovie[indexPath.row] // Ambil data dari array dataTo
    cell.configure(with: title) // Berikan data ke cell
    
    return cell
  }
}
