

import UIKit

extension UIImageView {
    
    /* Esta función loadFrom(url:) es responsable de cargar una imagen desde una URL y establecerla en una propiedad de tipo UIImage en la clase o estructura que contiene esta función (posiblemente una subclase de UIImageView o una vista personalizada con una propiedad de imagen).*/
    
    //Con URL sin construir
    func loadFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    //Con URL construida
    func loadFrom(url: String) {
        self.loadFrom(url: URL(string: url)!)
    }
    
    func loadFrom(url: String, completionHandler: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: url)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completionHandler(image)
                    }
                }
            }
        }
    }
}
