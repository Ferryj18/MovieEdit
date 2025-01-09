//
//  HomeProcotol.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//
import UIKit

protocol VTPHomeProtocol: AnyObject {
    var view: PTVHomeProtocol? { get set }
    var interactor: PTIHomeProtocol? { get set }
    var router: PTRHomeProtocol? { get set }
    
  func getTrendingMovies(key: String)
  func getMovies(key: String)
  func startNavToDetail(data: [Title], nav: UINavigationController)

    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    
  func getTrendingMovies(key: String)
  func getMovies(key: String)
}

protocol ITPHomeProtocol: AnyObject {
    func onSuccessGetTrendingMovies(data: [Title])
  func onSuccessGetMovies(data: [Title], movieType: MovieType)

    func onFailedGet(message: String)
}



protocol PTVHomeProtocol: AnyObject {
  func successGetTrendingMovies (data: [Title])
  func successGetMovies(data: [Title], movieType: MovieType)

    func failedGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
  static func createHomeModule() -> HomeVC
  func navToDetail(data: [Title], nav: UINavigationController)
  
}
