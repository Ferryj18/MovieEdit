//
//  HomePresenter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//
import Foundation
import UIKit

class HomePresenter: VTPHomeProtocol {

  
  
  
    
    //MARK: - Property HomePresenter
    var view: PTVHomeProtocol?
    var interactor: PTIHomeProtocol?
    var router: PTRHomeProtocol?
    var viewController : HomeVC!

    //MARK: - Lifecycle HomePresenter
    init() {}
    
    init(viewController: HomeVC ) {
        self.viewController = viewController
    }
    
    //MARK: - Function HomePresenter
    
  func startGetMovieHeader(apiKey: String, completion: @escaping (Result<[Title], Error>) -> Void) {
    interactor?.getMovieHeader(apiKey: apiKey, completion: completion)
    }
    
  func getAllMovies(category: sections, completion: @escaping (Result<[Title], Error>) -> Void) {
      interactor?.getAllMovies(category: category, completion: completion)
  }
    
  func startNavToDetail(data: [Title], nav: UINavigationController) {
        router?.navToDetail(data: data, nav: nav)
    }
    
  func startNavToDetailFromCell(data: [Title], index: Int, nav: UINavigationController) {
        router?.navToDetailFromCell(data: data, index: index, nav: nav)
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
    func onFailedGet(message: String) {
        view?.failedGet(message: message)
    }
    

}
