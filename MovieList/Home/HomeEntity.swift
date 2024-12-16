//
//  HomeEntity.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation
import SwiftyJSON

// Response Model
struct MovieResponseModel: Decodable {
    let page: Int
    let results: [TrendingMovieModel]
}

// Individual Movie Model
struct TrendingMovieModel: Decodable {
    let id: Int
    let title: String
    let original_title: String
    let overview: String
    let poster_path: String?
    let backdrop_path: String?
    let media_type: String
    let adult: Bool
    let original_language: String
    let genre_ids: [Int]
    let popularity: Double
    let release_date: String?
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
struct TitlePreviewViewModel {
    let title: String
    let youtubeView: VideoElement
    let titleOverview: String?
}
struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String?
}
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

//// Root Response Model untuk Semua Jenis Film (Now Playing, Popular, Top Rated)
//struct AllMoviesResponseModel: Decodable {
//    let page: Int
//    let results: AllMoviesResults
//    let dates: MovieDatesModel
//}
//
//// Model untuk Memisahkan Semua Jenis Film
//struct AllMoviesResults: Decodable {
//    let nowPlaying: [MovieModel]
//    let popular: [MovieModel]
//    let topRated: [MovieModel]
//}
//
//// Movie Dates Model (jika ada batas tanggal)
//struct MovieDatesModel: Decodable {
//    let maximum: String
//    let minimum: String
//}
//
//// Model untuk Setiap Film
//struct MovieModel: Decodable {
//    let id: Int
//    let title: String
//    let original_title: String
//    let overview: String
//    let poster_path: String?
//    let backdrop_path: String?
//    let media_type: String
//    let adult: Bool
//    let original_language: String
//    let genre_ids: [Int]
//    let popularity: Double
//    let release_date: String?
//    let video: Bool
//    let vote_average: Double
//    let vote_count: Int
//}
