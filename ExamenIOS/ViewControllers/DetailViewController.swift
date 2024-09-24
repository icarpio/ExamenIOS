//
//  DetailViewController.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedMovie: Movie? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!

    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let id = selectedMovie!.imdbID
        
        API.getMovieByID(id) { movie in
            DispatchQueue.main.async {
                if movie!.poster == "N/A" {
                    // Cargar imagen predeterminada
                    self.posterImage.image = UIImage(named: "NoImage")
                } else {
                    // Cargar la imagen desde la URL
                    self.posterImage.loadFrom(url: movie!.poster)
                }
                self.titleLabel.text = movie?.title ?? "Título no disponible"
                self.yearLabel.text = movie?.year ?? "Año no disponible"
                if movie!.plot == "N/A" {
                    // Cargar imagen predeterminada
                    self.plotTextView.text = "Sinopsis no disponible"
                } else {
                    self.plotTextView.text = movie?.plot
                }
                self.runtimeLabel.text = movie?.runtime ?? "Duración no disponible"
                self.genreLabel.text = movie?.genre ?? "Género no disponible"
                self.directorLabel.text = movie?.director ?? "Director no disponible"
                self.countryLabel.text = movie?.country ?? "País no disponible"
            }
        }
        
    }
    
    
    
    
}
