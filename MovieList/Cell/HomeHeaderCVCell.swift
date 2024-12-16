//
//  HomeHeaderCVCell.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import SDWebImage

class HomeHeaderCVCell: UICollectionViewCell {

  @IBOutlet weak var imgHeaderMovie: UIImageView!
  var parentViewController: UIViewController?
  static let identifier = "HomeHeaderCVCell"
  static func nib() -> UINib{
    return UINib(nibName: "HomeHeaderCVCell", bundle: nil)
  }
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
            imgHeaderMovie.sd_setImage(with: url, completed: nil)
          } else {
            imgHeaderMovie.image = UIImage(named: "") // Placeholder jika poster tidak ada
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
