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
  var dataToPopular: [Title] = []
  var dataUpcoming : [Title] = []
  var dataTopRated : [Title] = []
  var parentViewController: UIViewController?
  var indexNumb: Int?
  var url: String?
  
  static let identifier = "HomeMovieCollTVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCollTVCell", bundle: nil)
  }
  func configure(with dataAllMovie: [Title]) {
    self.dataToPopular = dataAllMovie
    clcAllMovie.reloadData()
    }
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
      clcAllMovie.register(HomeMovieCVCell.nib(), forCellWithReuseIdentifier: HomeMovieCVCell.identifier)
      clcAllMovie.delegate = self
      clcAllMovie.dataSource = self
    clcAllMovie.backgroundColor = .black
    }
    
  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
    }
    
  }
//
extension HomeMovieCollTVCell:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataToPopular.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // Dequeue the cell
    let cell = clcAllMovie.dequeueReusableCell(withReuseIdentifier: HomeMovieCVCell.identifier, for: indexPath) as! HomeMovieCVCell
    
    // Configure the cell with the movie data
    cell.configure(with: dataToPopular[indexPath.row])
    
    // Return the properly configured cell
    return cell
  }
}
