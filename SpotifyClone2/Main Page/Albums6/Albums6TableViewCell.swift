//
//  Albums6TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 20.08.2023.
//

import UIKit

class Albums6TableViewCell: UITableViewCell {
    
    @IBOutlet weak var albums6Label: UILabel!
    
    @IBOutlet weak var albums6CollectionView: UICollectionView!
    
    var albumList = [Albums]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums6CollectionView.delegate = self
        albums6CollectionView.dataSource = self
        albums6CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "sezenaksu1", albums_Singer: "Sezen Aksu")
        let a2 = Albums(albums_Id: 2, albums_Image: "sabahkahvesi", albums_Singer: "Sabah Kahvesi")
        let a3 = Albums(albums_Id: 3, albums_Image: "eminembestof", albums_Singer: "EMINEM BEST OF")
        let a4 = Albums(albums_Id: 4, albums_Image: "eminem1", albums_Singer: "Eminem")
        let a5 = Albums(albums_Id: 5, albums_Image: "90sdanceparty", albums_Singer: "90s Dance Party")
        let a6 = Albums(albums_Id: 6, albums_Image: "60sbesties", albums_Singer: "60s Besties")
       
        albumList.append(a1)
        albumList.append(a2)
        albumList.append(a3)
        albumList.append(a4)
        albumList.append(a5)
        albumList.append(a6)
        
        
        configureLayout()
        customNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
    
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing) / 2.5
        layout.itemSize = CGSize(width: itemWidth * 0.7 , height: itemWidth * 1.5 * 0.7)
        
        albums6CollectionView.collectionViewLayout = layout
        albums6CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums6CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}


extension Albums6TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums6CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumLabel.textAlignment = .center
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
}
