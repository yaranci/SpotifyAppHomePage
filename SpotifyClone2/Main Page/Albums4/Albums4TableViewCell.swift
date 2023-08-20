//
//  Albums4TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 20.08.2023.
//

import UIKit

class Albums4TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var albums4CollectionView: UICollectionView!
    @IBOutlet weak var albums4Label: UILabel!
    
    var albumList = [Albums]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums4CollectionView.delegate = self
        albums4CollectionView.dataSource = self
        albums4CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "easy90s", albums_Singer: "Red Hot Chili Peppers, Michael Jackson")
        let a2 = Albums(albums_Id: 2, albums_Image: "mutluturkce", albums_Singer: "Sezen Aksu, Mabel Matiz, Emir Can İğrek")
        let a3 = Albums(albums_Id: 3, albums_Image: "kiyiboyu", albums_Singer: "TSimge, Yüzyüzeyken Konuşuruz")
        let a4 = Albums(albums_Id: 4, albums_Image: "hafifmuzik", albums_Singer: "Melike Şahin, EDIS, Nev")
        let a5 = Albums(albums_Id: 5, albums_Image: "90sdanceparty", albums_Singer: "Hakan Peker, Kenan Doğulu, Serdar Ortaç")
       
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
        
        albums4CollectionView.collectionViewLayout = layout
        albums4CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums4CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}


extension Albums4TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums4CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
}
