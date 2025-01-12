//
//  DetailVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import WebKit
import Kingfisher

class DetailVC: UIViewController {
    
    
    
    @IBOutlet weak var wkMovie: WKWebView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    var presenter: VTPDetailProtocol?
//    private var viewModel: TitlePreviewViewModel?
    var dataMovie: [Title] = []
    var dataDetail: Title?
  var key = "883b20661c35f38e181243f7361f28f3"
    //  var sections : sections = .TrendingMovies
    var indexNumb: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        setUpData()
        // Do any additional setup after loading the view.
    }
    
  func setUpView(){
    self.lblTitle.text = dataDetail?.title
    self.lblOverview.text = dataDetail?.overview
  
    wkMovie.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Make it responsive
  }
  func setUpAction(){
    
  }
  func setUpData(){
    guard let movieId = dataDetail?.id else {
                print("Movie ID is nil.")
                return
            }
    presenter?.getVideoDetails(movieId: movieId, key: key)
  }
}
extension DetailVC: PTVDetailProtocol {
  func successGetVideoDetails(videoURL: String) {
    // Load the video URL in the WKWebView
           if let videoURL = URL(string: videoURL) {
               let request = URLRequest(url: videoURL)
               DispatchQueue.main.async {
                   self.wkMovie.load(request) // Load the video in the WKWebView
               }
           }
       }
  


   
  func failedGet(message: String) {
    print(message)
    Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
    
}
  
  
  
}
