//
//  Albums5TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 20.08.2023.
//

import UIKit

class Albums5TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var albums5Label: UILabel!
    @IBOutlet weak var albums5CollectionView: UICollectionView!
    
    var albumList = [Albums]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums5CollectionView.delegate = self
        albums5CollectionView.dataSource = self
        albums5CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "sia1", albums_Singer: "Sia")
        let a2 = Albums(albums_Id: 2, albums_Image: "therollingstones1", albums_Singer: "The Rolling Stones")
        let a3 = Albums(albums_Id: 3, albums_Image: "sezenaksu1", albums_Singer: "Sezen Aksu")
        let a4 = Albums(albums_Id: 4, albums_Image: "eminem1", albums_Singer: "Eminem")
        let a5 = Albums(albums_Id: 5, albums_Image: "barisakarsu1", albums_Singer: "Barış Akarsu")
       
        albumList.append(a1)
        albumList.append(a2)
        albumList.append(a3)
        albumList.append(a4)
        albumList.append(a5)
        
        
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
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        
        albums5CollectionView.collectionViewLayout = layout
        albums5CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums5CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}


extension Albums5TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums5CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumLabel.textAlignment = .center
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
}
