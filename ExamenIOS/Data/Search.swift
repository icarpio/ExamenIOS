//
//  Movie.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation


// Estructura para representar la respuesta completa
struct MovieSearchResponse: Codable {
    let search: [Movie]
    let totalResults: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct Movie:Codable{
    let title: String
    let year: String
    let poster:String
    let genre: String?
    let country:String?
    let director: String?
    let runtime: String?
    let plot: String?
    let imdbID: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case country = "Country"
        case poster = "Poster"
        case director = "Director"
        case runtime = "Runtime"
        case plot = "Plot"
        case imdbID
        case type = "Type"
    }
}
