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
  var dataDetail : [Title] = []
  var parentViewController: UIViewController?
  var indexNumb: Int?
  var url: String?
  
  static let identifier = "HomeMovieCollTVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCollTVCell", bundle: nil)
  }
  func configure(with dataAllMovie: [Title]) {
    self.dataDetail = dataAllMovie
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
    return dataDetail.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // Dequeue the cell
    let cell = clcAllMovie.dequeueReusableCell(withReuseIdentifier: HomeMovieCVCell.identifier, for: indexPath) as! HomeMovieCVCell
    
    // Configure the cell with the movie data
    cell.configure(with: dataDetail[indexPath.row])
    
    // Return the properly configured cell
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // Ensure the presenter is set
    // Ensure the presenter is set
    guard let presenter = presenter else {
        print("Presenter is not set")
        return
    }
      
      // Call the presenter to handle the selection
    presenter.startNavToDetail(data: dataDetail, index: indexPath.item, nav: (parentViewController?.navigationController)!)  }
}
