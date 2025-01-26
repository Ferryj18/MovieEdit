//
//  SearchView.swift
//  MovieList
//
//  Created by Prizega Fromadia on 27/01/25.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func didPerformSearch(with results: String)
}

class SearchView: UIViewController {
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var searchTxtField: UITextField!
    
    let tapGesture = UITapGestureRecognizer(target: SearchView.self, action: #selector(dismissSearch))
    weak var delegate: SearchViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpAction()
        // Do any additional setup after loading the view.
    }
    func setUpView(){
        searchTxtField.layer.cornerRadius = 10
        searchTxtField.borderStyle = .line
        searchTxtField.tintColor = .black
        searchTxtField.placeholder = "Search ...."
        searchTxtField.layer.masksToBounds = true
        animateTextField()
    }
    
    func setUpAction(){
        blurView.addGestureRecognizer(tapGesture)
        searchTxtField.addTarget(
            self,
            action: #selector(handleSearch),
            for: .editingDidEndOnExit)
        
    }
    
}

extension SearchView {
    func animateTextField() {
        UIView.animate(withDuration: 0.3) {
            self.searchTxtField.alpha = 1
        }
    }
    
    @objc func dismissSearch() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSearch() {
        guard let query = searchTxtField.text, !query.isEmpty else { return }
        delegate?.didPerformSearch(with: query)
        dismissSearch()
    }
}
