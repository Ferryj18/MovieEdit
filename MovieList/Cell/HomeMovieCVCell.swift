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
  var dataMovie: [Title] = []
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
              let vw = DetailRouter.createDetailModule()
              navigation.pushViewController(vw, animated: true)
          }
      }
  }
  
  

}
