//
//  Albums2TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 19.08.2023.
//

import UIKit

class Albums2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var albums2CollectionView: UICollectionView!
    @IBOutlet weak var album2Label: UILabel!
    
    var albumList = [Albums]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        albums2CollectionView.delegate = self
        albums2CollectionView.dataSource = self
        albums2CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "dailymix1", albums_Singer: "50 Cent, Eminem,JAYY-Z ve daha fazlası")
        let a2 = Albums(albums_Id: 2, albums_Image: "dailymix2", albums_Singer: "Adamlar, Duman, Emre Fel ve daha fazlası")
        let a3 = Albums(albums_Id: 3, albums_Image: "dailymix3", albums_Singer: "Nova Norda, Madrigal ve daha fazlası")
        let a4 = Albums(albums_Id: 4, albums_Image: "dailymix4", albums_Singer: "Sezen Aksu, Göksel, Ayten Alpman ve daha fazlası")
        let a5 = Albums(albums_Id: 5, albums_Image: "dailymix5", albums_Singer: "Dolu kadehi ters tut, mor ve ötesi ve daha fazlası")
        let a6 = Albums(albums_Id: 6, albums_Image: "dailymix6", albums_Singer: "Dalida, Charles Aznavour, Zaz ve daha fazlası")
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
        
        albums2CollectionView.collectionViewLayout = layout
        albums2CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums2CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}

extension Albums2TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums2CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
