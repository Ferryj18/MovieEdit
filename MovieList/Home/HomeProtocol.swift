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
    
    func startGetMovieHeader(apiKey: String, completion: @escaping (Result<[Title], Error>) -> Void)
    func getAllMovies(category: sections, completion: @escaping (Result<[Title], Error>) -> Void)
    
  func startNavToDetail(data: [Title], nav: UINavigationController)
  func startNavToDetailFromCell(data: [Title], index: Int, nav: UINavigationController)
    
}

protocol PTIHomeProtocol: AnyObject {
    var presenter: ITPHomeProtocol? { get set }
    
  func getMovieHeader(apiKey: String, completion: @escaping (Result<[Title], Error>) -> Void)
    func getAllMovies(category: sections, completion: @escaping (Result<[Title], Error>) -> Void)

}

protocol ITPHomeProtocol: AnyObject {
//  func onSuccessGetMovieHeader(data: [Title])
//    func onSuccessGetAllMovies(data: [Title])
    func onFailedGet(message: String)
    
}

protocol PTVHomeProtocol: AnyObject {
//  func successGetMovieHeader(data: [Title])
//    func successGetAllMovies(data: [Title])
    func failedGet(message: String)
}

protocol PTRHomeProtocol: AnyObject {
    static func createHomeModule() -> HomeVC
  func navToDetail(data: [Title], nav: UINavigationController)
      func navToDetailFromCell(data: [Title], index: Int, nav: UINavigationController)
}
