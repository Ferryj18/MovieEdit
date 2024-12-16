//
//  HomeInteractor.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class HomeInteractor: PTIHomeProtocol {
  
  
  var presenter: ITPHomeProtocol?
  
  func getMovieHeader(apiKey: String, completion: @escaping (Result<[Title], any Error>) -> Void) {
    let apiUrl = "https://api.themoviedb.org/3/trending/movie/day"
    let parameters: [String: Any] = [
      "api_key": apiKey
    ]
    
    // Alamofire request with parameters
    AF.request(apiUrl, method: .get, parameters: parameters).responseJSON { response in
      switch response.result {
      case .success(let value):
        let json = JSON(value) // Parse the response using SwiftyJSON
        
        // Parse the results from the "results" key
        do {
          let jsonData = try json["results"].rawData()
          let decoder = JSONDecoder()
          let movies = try decoder.decode([Title].self, from: jsonData)
          print("Parsed Movies: \(movies)")
          // Return the parsed movies
          completion(.success(movies))
        } catch {
          // Handle the error in case of decoding failure
          print("Decoding error: \(error)")
          completion(.failure(error))
        }
        
      case .failure(let error):
        // Handle the Alamofire error
        print("Request error: \(error)")
        completion(.failure(error))
      }
    }
  }
    func getAllMovies(category: sections, completion: @escaping (Result<[Title], Error>) -> Void) {
        // Construct the URL based on the category
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(category.rawValue)?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        
        // Alamofire request with the constructed URL
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                // Parse the response using SwiftyJSON and decode the results
                do {
                    // Extract the 'results' key from the JSON and decode the array of Title objects
                    let jsonData = try json["results"].rawData()
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode([Title].self, from: jsonData)
                    completion(.success(movies))  // Return the movies array
                    
                } catch {
                    print("Error decoding response: \(error)")
                    completion(.failure(error))  // Return any decoding errors
                }
                
            case .failure(let error):
                print("Error fetching data: \(error)")
                completion(.failure(error))  // Return Alamofire request error
            }
        }
    }
  }
  

