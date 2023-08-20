//
//  FierstCollectionViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 16.08.2023.
//

import UIKit

class PlayListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var playListImage: UIImageView!
    @IBOutlet weak var playListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        playListImage.backgroundColor = .black
        playListImage.layer.cornerRadius = 5
        playListImage.clipsToBounds = true
        playListImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        
        
    }
    
}
