//
//  Api.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//


import Foundation

class API {
    let apiKey = "80e1f2fe"
    
    static func searchMovie(_ title: String, withResult: @escaping ([Movie]) -> Void) {
        let apiKey = "80e1f2fe"
        let urlString = "https://www.omdbapi.com/?s=\(title)&apikey=\(apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Manejo de errores
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // Decodificación del JSON en MovieSearchResponse
                let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                
                // Llamar a la función con los resultados
                withResult(result.search)
               
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    static func getMovieByID(_ id: String, withResult: @escaping (Movie?) -> Void) {
        let apiKey = "80e1f2fe"
        let urlString = "https://www.omdbapi.com/?i=\(id)&apikey=\(apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Manejo de errores
                print("Error: \(error.localizedDescription)")
                withResult(nil) // Retorna nil en caso de error
                return
            }
            
            guard let data = data else {
                print("No data received")
                withResult(nil) // Retorna nil si no se recibe datos
                return
            }
            
            do {
                // Decodificación del JSON en Movie
                let result = try JSONDecoder().decode(Movie.self, from: data)
                
                // Llamar a la función con los resultados
                withResult(result)
                print(result)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                withResult(nil) // Retorna nil si hay error de decodificación
            }
        }
        task.resume()
    }

    
    
}

