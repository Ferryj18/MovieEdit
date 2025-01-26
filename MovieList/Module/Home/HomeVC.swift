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
    @IBOutlet weak var btnSearch: UIButton!
    
    
    var presenter: VTPHomeProtocol?
    var dataAllMovie : [Title] = []
    var dataMovie : [Title] = []
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
        imgLogo.image = UIImage(named: "image_Logo")
        //
        clcHeader.register(HomeHeaderCVCell.nib(), forCellWithReuseIdentifier: HomeHeaderCVCell.identifier)
        clcHeader.delegate = self
        clcHeader.dataSource = self
        clcHeader.backgroundColor = .black
        clcHeader.isPagingEnabled = true // Enable paging
        tblMovie.register(
            HomeMovieCollTVCell.nib(),
            forCellReuseIdentifier: HomeMovieCollTVCell.identifier)
        tblMovie.delegate = self
        tblMovie.dataSource = self
        
        btnSearch.addTarget(
            self,
            action: #selector(searchButtonTapped),
            for: .touchUpInside
        )
        
        btnSearch.setTitle(
            "",
            for: .normal
        )
        btnSearch.setImage(
            UIImage(systemName: "magnifyingglass"),
            for: .normal
        )
        
        btnSearch.tintColor = .white
        
        
    }
    
    func setUpData(){
        presenter?.getAllMovies(key: key)
        presenter?.getTrendingMovies(key: key)
    }
    
    @objc func searchButtonTapped() {
        // Load SearchViewController from its xib file
        print("search pressed")
        let searchViewController = SearchView(nibName: "SearchView", bundle: nil)
        searchViewController.modalPresentationStyle = .overFullScreen
        searchViewController.modalTransitionStyle = .crossDissolve
        searchViewController.delegate = self
        present(searchViewController, animated: true, completion: nil)
    }
    
    
}

extension HomeVC: SearchViewDelegate {
    func didPerformSearch(with results: String) {
        performSearch(with: results)
    }
    
    
}

extension HomeVC {
    private func performSearch(with query: String) {
        // Implement your search/filter logic here
        // For example, filter data in an array:
        let allData = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
        let filteredData = allData.filter { $0.lowercased().contains(query.lowercased()) }
        print("Filtered Data: \(filteredData)")
    }
}

extension HomeVC: PTVHomeProtocol{
    func successGetTrendingMovies(data: [Title]) {
        dataMovie = data
        print("Data Movie Count: \(dataMovie.count)")
        clcHeader.reloadData()
    }
    
    func successGetAllMovies(data: [Title]) {
        dataAllMovie = data
        for _ in data {
            rowCount = (rowCount ?? 0)+1
        }
        tblMovie.reloadData()
        print("success")
        LoadingIndicator.stopAnimating()
        
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
        print("Data Movie Count: \(dataMovie.count)")
        return dataMovie.count
        
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
        
        
        // Get category based on section index
        let category = sectionHeaders[indexPath.section]
        
        // Configure the cell with data based on category
        switch category {
        case "Popular":
            cell.configure(with: dataAllMovie) // Populate with popular movies
        case "Upcoming":
            cell.configure(with: dataAllMovie) // Populate with upcoming movies
        case "Top Rated":
            cell.configure(with: dataAllMovie) // Populate with top rated movies
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
}
