//
//  HomePresenter.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//
import Foundation
import UIKit

import Foundation

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
    
  func getTrendingMovies(key: String){
        interactor?.getTrendingMovies(key: key)
    }
    
  func getPopularMovies(key: String) {
    interactor?.getPopularMovies(key: key)
  }
  func getUpcomingMovies(key: String) {
      interactor?.getUpcomingMovies(key: key)
  }
  func getTopRatedMovies(key: String) {
      interactor?.getTopRatedMovies(key: key)
  }
    
    func startNavToDetail(data: [Title], nav: UINavigationController) {
        router?.navToDetail(data: data, nav: nav)
    }
    
    
}

    //MARK: - Extension HomePresenter
extension  HomePresenter : ITPHomeProtocol {
  func onSuccessGetPopularMovies(data: [Title]) {
    view?.successGetPopularMovies(data: data)
  }
  
  func onSuccessGetUpcomingMovies(data: [Title]) {
    view?.successGetUpcomingMovies(data: data)
  }
  
  func onSuccessGetTopRatedMovies(data: [Title]) {
    view?.successGetTopRatedMovies(data: data)
  }
  
  func onSuccessGetTrendingMovies(data: [Title]) {
    view?.successGetTrendingMovies(data: data)
  }
  
  
  
    func onFailedGet(message: String) {
        view?.failedGet(message: message)
    }
    

}

