//
//  DetailVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

  
  
  @IBOutlet weak var wkMovie: WKWebView!
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblOverview: UILabel!
  
  var presenter: VTPDetailProtocol?
  private var viewModel: TitlePreviewViewModel?
  var dataMovie: [Title] = []
  var dataAllMovie: [Title] = []
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
    
  }
  func setUpAction(){
    
  }
  func setUpData(){
    
  }
  
  // Method to set up the view model
        public func configure(with model: TitlePreviewViewModel) {
            self.viewModel = model
        }
  
  // Update the UI elements
        private func configureUI() {
            guard let viewModel = viewModel else {
                print("ViewModel is nil")
                return
            }

            // Set text for labels
            lblTitle.text = viewModel.title
            lblOverview.text = viewModel.titleOverview
            
            // Safely load YouTube video
            if let videoId = viewModel.youtubeView.id.videoId {
                let urlString = "https://www.youtube.com/embed/\(videoId)"
                if let url = URL(string: urlString) {
                    let request = URLRequest(url: url)
                  wkMovie.load(request)
                } else {
                    print("Invalid YouTube URL: \(urlString)")
                }
            } else {
                print("Invalid video ID")
            }

            // Optional: Enable developer extras for debugging
          wkMovie.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        }
    }
