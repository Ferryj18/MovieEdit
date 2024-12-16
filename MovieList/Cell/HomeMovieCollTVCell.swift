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
  var dataTo: [Title] = []
  var parentViewController: UIViewController?
  var indexNumb: Int?
  var url: String?
  
  static let identifier = "HomeMovieCollTVCell"
  //  weak var delegate: CollectionTableViewCellDelegate?
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCollTVCell", bundle: nil)
  }
  func configure(with dataTo: [Title]) {
    self.dataTo = dataTo
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
      
      // Configure the view for the selected state
    }
    
  }
}

extension HomeMovieCollTVCell:  UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataTo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = clcAllMovie.dequeueReusableCell(withReuseIdentifier: HomeMovieCVCell.identifier, for: indexPath) as!HomeMovieCVCell
    
    let title = dataTo[indexPath.row] // Ambil data dari array dataTo
    cell.configure(with: title) // Berikan data ke cell
    
    return cell
  }
  //  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //    collectionView.deselectItem(at: indexPath, animated: true)
  //    let title = dataTo[indexPath.row]
  //
  //    // Unwrap the original_title or original_name
  //    guard let titleName = title.original_title ?? title.original_name else {
  //      return
  //    }
  //
  //    // Call the API and handle the result
  //    APICaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
  //      switch result {
  //      case .success(let videoElement):
  //
  //        let title = self?.dataTo[indexPath.row]
  //        guard let titleOverview = title?.overview else {
  //          return
  //        }
  //        guard let strongSelf = self else {
  //          return
  //        }
  //        let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: titleOverview)
  //        self?.presenter?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
  //
  //      case .failure(let error):
  //        print(error.localizedDescription)
  //      }
  //
  //    }
  //  }
  //}
}
