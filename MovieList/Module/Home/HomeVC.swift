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
    
    
    var presenter: VTPHomeProtocol?
    var dataMovie : [Title] = []
  var dataTopRated : [Title] = []
  var dataUpcoming : [Title] = []
  var dataPopular : [Title] = []
    var key = "883b20661c35f38e181243f7361f28f3"
    //  var indexNumb: Int?
    
    var rowCount: Int? = 0
    let sectionHeaders = ["Popular","Upcoming","Top Rated"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpData()
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        imgLogo.image = UIImage(named: "imageLogo")
        //
        clcHeader.register(HomeHeaderCVCell.nib(), forCellWithReuseIdentifier: HomeHeaderCVCell.identifier)
        clcHeader.delegate = self
        clcHeader.dataSource = self
      clcHeader.backgroundColor = .black
          clcHeader.isPagingEnabled = true // Enable paging
        tblMovie.register(HomeMovieCollTVCell.nib(), forCellReuseIdentifier: HomeMovieCollTVCell.identifier)
        tblMovie.delegate = self
        tblMovie.dataSource = self
      tblMovie.backgroundColor = .black
        
    }
    
    func setUpData(){
      presenter?.getTopRatedMovies(key: key)
      presenter?.getUpcomingMovies(key: key)
      presenter?.getPopularMovies(key: key)
        presenter?.getTrendingMovies(key: key)
    }
    
    
}
extension HomeVC: PTVHomeProtocol{
  func successGetPopularMovies(data: [Title]) {
    dataPopular = data
    print("Data Popular Count: \(dataPopular.count)")
    tblMovie.reloadData()
  }
  
  func successGetUpcomingMovies(data: [Title]) {
    dataUpcoming = data
    print("Data Upcoming Count: \(dataUpcoming.count)")
    tblMovie.reloadData()
  }
  
  func successGetTopRatedMovies(data: [Title]) {
    dataTopRated = data
    print("Data TopRated Count: \(dataTopRated.count)")
    tblMovie.reloadData()
  }
  
  func successGetTrendingMovies(data: [Title]) {
    dataMovie = data
    print("Data Movie Count: \(dataMovie.count)")
    clcHeader.reloadData()
    
  }
    
    func failedGet(message: String) {
        print(message)
        Alert.showGeneralAlert(title: "Error", message: message, viewController: self)
        
    }
    
    
}
// header trending
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource{
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1 // Only one section for horizontal scroll
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    print("Data Movie Count: \(dataMovie.count)")
    return dataMovie.count
    
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: clcHeader.frame.width, height: clcHeader.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeHeaderCVCell", for: indexPath) as? HomeHeaderCVCell else {
      return UICollectionViewCell()
    }
    // Configure the cell with data
    let movie = dataMovie[indexPath.row] // Assuming dataTo holds your movie data
    cell.configure(with: movie)
    
    return cell
  }
}
// All Movies table
extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeMovieCollTVCell.identifier, for: indexPath) as? HomeMovieCollTVCell else {
          return UITableViewCell()
      }
      
      switch indexPath.section {
      case 0: // Popular
          cell.configure(with: dataPopular)
      case 1: // Upcoming
          cell.configure(with: dataUpcoming)
      case 2: // Top Rated
          cell.configure(with: dataTopRated)
      default:
          break
      }
      
      return cell
  }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        
        // Set label text dari section header
        label.text = sectionHeaders[section]
        
        // Set font dan ukuran sesuai kebutuhan
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Ganti dengan font yang diinginkan
        label.textColor = .white // Ganti dengan warna yang diinginkan
        label.backgroundColor = .black
        
        // Add label ke header view
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        // Set constraint untuk label agar tampil dengan benar
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15)
        ])
        
        // Styling untuk header view (opsional)
        headerView.backgroundColor = .black // Menambahkan warna latar belakang pada header
        
        return headerView
    }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 250.0
    }
}
