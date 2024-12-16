//
//  HomeVC.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import UIKit

class HomeVC: UIViewController{
  
  
  
  @IBOutlet weak var imgLogo: UIImageView!
  @IBOutlet weak var clcHeader: UICollectionView!
  @IBOutlet weak var tblMovie: UITableView!
  
  var homeInteractor: PTIHomeProtocol = HomeInteractor()
  var presenter: VTPHomeProtocol?
  var dataTrending : [Title] = []
  var dataTo : [Title] = []
  var apiKey = "883b20661c35f38e181243f7361f28f3"
  var indexNumb: Int?
  var url: String?
  let currentDate = Date()
  var rowCount: Int? = 0
  let sectionHeaders = ["Popular","Upcoming","Top Rated"]
 
  override func viewDidLoad() {
        super.viewDidLoad()
    setUpView()
    setUpAction()
        // Do any additional setup after loading the view.
    }

  func setUpView(){
    imgLogo.image = UIImage(named: "imageLogo")
    //
    clcHeader.register(HomeHeaderCVCell.nib(), forCellWithReuseIdentifier: HomeHeaderCVCell.identifier)
    clcHeader.delegate = self
    clcHeader.dataSource = self
    tblMovie.register(HomeMovieCollTVCell.nib(), forCellReuseIdentifier: HomeMovieCollTVCell.identifier)
    tblMovie.delegate = self
    tblMovie.dataSource = self
            
  }
  func setUpAction(){
  }
  
//  func setUpData(){
//    let from = DateToString.shared.formatTodayDateToString(date: DateManipulator.decreaseDateByOneMonth(from: currentDate) ?? Date())
//    let to = DateToString.shared.formatTodayDateToString(date: currentDate)
//    presenter?.gstartGetMovieHeader(apiKey: String)
//    presenter?.GetAllMovies(apiKey: apiKey)
//  }
//  

}
extension HomeVC: PTVHomeProtocol{
 
  
  func failedGet(message: String) {
    print(message)
    Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
  }
  
  
  
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionHeaders.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rowCount ?? 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMovieCollTVCell.identifier, for: indexPath)  as? HomeMovieCollTVCell else {
      return UITableViewCell()
    }
    cell.configure(with: dataTo)
    switch indexPath.section {
      
    case sections.Popular.rawValue:
      homeInteractor.getAllMovies(category: .Popular) { result in
        switch result {
        case .success(let movies):
          // Handle the movies array
          print(movies)
          
        case .failure(let error):
          // Handle the error
          print("Failed to fetch movies: \(error.localizedDescription)")
        }
      }
      
    case sections.Upcoming.rawValue:
      homeInteractor.getAllMovies(category: .Upcoming) { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
      
    case sections.TopRated.rawValue:
      homeInteractor.getAllMovies(category: .TopRated) { result in
        switch result {
        case .success(let titles):
          cell.configure(with: titles)
        case .failure(let error):
          print(error)
        }
      }
    default:
      return UITableViewCell()
      
    }
    return cell
  }
}
extension HomeVC : UICollectionViewDataSource, UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataTo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCVCell.identifier, for: indexPath) as? HomeHeaderCVCell else {
      return UICollectionViewCell() // Return a default UICollectionViewCell if dequeue fails
    }
    
    // Configure the cell as needed
    // cell.configure(with: someData)
    
    return cell
  }
}
