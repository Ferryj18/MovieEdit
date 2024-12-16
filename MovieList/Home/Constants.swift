//
//  Constants.swift
//  MovieList
//
//  Created by Ferry jati on 16/12/24.
//

import Foundation

struct Constants {
    static let API_KEY = "883b20661c35f38e181243f7361f28f3"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyDqX8axTGeNpXRiISTGL7Tya7fjKJDYi4g"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedTogetData
}

//struct ConstantApp {
//    static let emptyString = ""
//    static let coreDataRecentlyViewedMovie = "RecentlyViewedMovie"
//    static let unresolvedError = "Unresolved error %@"
//    static let uiSceneConfiguration = "Default Configuration"
//    static let horiNaviItem: CGFloat = -1000
//    static let VertiNaviItem: CGFloat = 0
//}
//class ConstantAPIStuff {
//    static var host = "https://api.themoviedb.org/3/"
//    static let tmdbApiKey = "TMDB_API_KEY".apiKeyTMDB
//    static let tmdbTokenKey = "TMDB_TOKEN_KEY".tokenKeyTMDB
////    static let adBannerUnitID = "AD_BANNER_UNIT_ID".adBannerUnitID
////    static let testDeviceIdentifiers = "TEST_DEVICE_AD".testDeviceIdentifiers
////    static let adRewardedUnitID = "AD_REWARDED_UNIT_ID".adRewardedUnitID
////    static let geminiApiKey = "GEMINI_API_KEY".geminiApiKey
//}
