//
//  ViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // Array para almacenar los resultados de las películas
    var moviesList: [Movie] = []
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func searchButton(_ sender: Any) {
        guard let movieTitle = searchTextField.text, !movieTitle.isEmpty else {
            print("Please enter a movie title.")
            return
        }
        
        // Llama a la API con el valor del textField
        API.searchMovie(movieTitle) { movies in
            DispatchQueue.main.async {
                self.moviesList = movies
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Desencolamos una celda reutilizable
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        // Obtenemos el superhéroe para la ruta de índice actual
        let movie = moviesList[indexPath.row]
        
        // Renderizamos el superhéroe en la celda
        cell.render(movie: movie)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "navegateToDetail" {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let selectedMovie = moviesList[indexPath.row]
                        let detailVC = segue.destination as! DetailViewController
                        detailVC.selectedMovie = selectedMovie
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                }
            }
    
}

