//
//  Albums1TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 19.08.2023.
//

import UIKit

class Albums1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var albums1CollectionView: UICollectionView!
    @IBOutlet weak var albums1Label: UILabel!
    
    var albumList = [Albums]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums1CollectionView.delegate = self
        albums1CollectionView.dataSource = self
        albums1CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "nutuk", albums_Singer: "Her Gün 10 Dakika Nutuk")
        let a2 = Albums(albums_Id: 2, albums_Image: "turkce100", albums_Singer: "Türkçe Rock En iyi 100 Çalma listesi • Türkçe Rock'ın En iyi 100 Şarkısı")
        let a3 = Albums(albums_Id: 3, albums_Image: "barisakarsu1", albums_Singer: "Barış Akarsu")
        let a4 = Albums(albums_Id: 4, albums_Image: "johnwick", albums_Singer: "John Wick 1, 2, 3, 4 S...")
        let a5 = Albums(albums_Id: 5, albums_Image: "60sbesties", albums_Singer: "60s besties Çalma Listesi")
        let a6 = Albums(albums_Id: 6, albums_Image: "eminem1", albums_Singer: "Eminem")
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
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        
        albums1CollectionView.collectionViewLayout = layout
        albums1CollectionView.isPagingEnabled = true
    }
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums1CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }

}


extension Albums1TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums1CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
