//
//  HomeMovieCVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import SDWebImage
class HomeMovieCVCell: UICollectionViewCell {

  
  @IBOutlet weak var imgAllMovie: UIImageView!
  
  @IBOutlet weak var lblNoData: UILabel!
  var parentViewController: UIViewController?
  var presenter: VTPHomeProtocol?
  static let identifier = "HomeMovieCVCell"
  var dataTo: [Title] = []
  var tapGesture : UITapGestureRecognizer!
  var url: String?
  static func nib() -> UINib{
    return UINib(nibName: "HomeMovieCVCell", bundle: nil)
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
      imgAllMovie.isUserInteractionEnabled = true
      imgAllMovie.addGestureRecognizer(tapGesture)
    }
  override var isSelected: Bool {
      didSet {
          super.isSelected = isSelected
          // Configure the view for the selected state
          if isSelected {
              // Code for when the cell is selected
          } else {
              // Code for when the cell is deselected
          }
      }
  }

  func configure(with title: Title) {
          // Set gambar untuk imageView menggunakan SDWebImage
          if let posterPath = title.poster_path {
              let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            imgAllMovie.sd_setImage(with: url, completed: nil)
          } else {
            imgAllMovie.image = UIImage(named: "") // Placeholder jika poster tidak ada
          }
      }
  @objc func imageTapped(_ sender: UITapGestureRecognizer) {
      if let viewController = parentViewController {
          if let navigation = viewController.navigationController{
//                let vw = DetailNewsRouter.createDetailNewsModule()
//                vw.dataAllNews = dataTo
//                vw.indexNumb = indexNumb ?? 0
//                vw.navFrom = .AllHeadline
              let vw = DetailRouter.createDetailModule()
              navigation.pushViewController(vw, animated: true)
          }
      }
  }
  
  

}
//extension HomeMovieCVCell: UICollectionViewDelegate{
//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//  collectionView.deselectItem(at: indexPath, animated: true)
//  let title = dataTo[indexPath.row]
//  
//  // Unwrap the original_title or original_name
//  guard let titleName = title.original_title ?? title.original_name else {
//    return
//  }
//  
//  // Call the API and handle the result
//  APICaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
//    switch result {
//    case .success(let videoElement):
//      
//      let title = self?.dataTo[indexPath.row]
//      guard let titleOverview = title?.overview else {
//        return
//      }
//      guard let strongSelf = self else {
//        return
//      }
//      let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: titleOverview)
//      self?.presenter?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
//
//    case .failure(let error):
//      print(error.localizedDescription)
//    }
//    
//  }
//}
//}


