//
//  LivroDoAutorViewCellTableViewCell.swift
//  LearningTask-8.2
//
//  Created by Raline Maria da Silva on 27/10/22.
//

import UIKit

class LivroDoAutorViewCell: UITableViewCell {

    
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var imagemView: UIImageView!
    
    var livro: Livro? {
        didSet {
            guard let livro = livro else { return }
            
            tituloLabel.text = livro.titulo
            imagemView.image = UIImage.init(livro.imagemDeCapaURI,
                                            aspectFillIn: imagemView.frame)
        }
    }
}
