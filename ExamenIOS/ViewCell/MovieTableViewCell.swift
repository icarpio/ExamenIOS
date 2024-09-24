//
//  CellTableViewCell.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    func render(movie:Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        // Verifica si el campo poster es "N/A"
        if movie.poster == "N/A" {
            // Cargar imagen predeterminada
            self.posterImage.image = UIImage(named: "NoImage") 
        } else {
            // Cargar la imagen desde la URL
            self.posterImage.loadFrom(url: movie.poster)
        }
        posterImage.layer.cornerRadius = 8;
        posterImage.layer.masksToBounds = true;
        posterImage.layer.borderWidth = 5;
        posterImage.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1);
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
