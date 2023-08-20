//
//  Albums3TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 20.08.2023.
//

import UIKit

class Albums3TableViewCell: UITableViewCell {
    
    @IBOutlet weak var albums3CollectionView: UICollectionView!
    @IBOutlet weak var albums3Label: UILabel!
    
    var albumList = [Albums]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums3CollectionView.delegate = self
        albums3CollectionView.dataSource = self
        albums3CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "2000lermix", albums_Singer: "Drake, Lifelike, 50 Cent ve dah afazlası")
        let a2 = Albums(albums_Id: 2, albums_Image: "popmix", albums_Singer: "Tones And I, EDIS ve daha fazlası")
        let a3 = Albums(albums_Id: 3, albums_Image: "bluesmix", albums_Singer: "The Bones Of J.R.Jones, John Lee Hooker ve daha fazlası")
        let a4 = Albums(albums_Id: 4, albums_Image: "hiphopmix", albums_Singer: "The Anonymous, Xzibit, The Madd Rapper ve daha fazlası")
        let a5 = Albums(albums_Id: 5, albums_Image: "rockmix", albums_Singer: "The Beatles, Linkin Park, Duman ve daha fazlası")
        let a6 = Albums(albums_Id: 6, albums_Image: "dalidamix", albums_Singer: "Dalida, Charles Aznavour, Zaz ve daha fazlası")
        let a7 = Albums(albums_Id: 7, albums_Image: "dailymix5", albums_Singer: "Yüksek Sadakat ve daha fazlası")
        albumList.append(a1)
        albumList.append(a2)
        albumList.append(a3)
        albumList.append(a4)
        albumList.append(a5)
        albumList.append(a6)
        albumList.append(a7)
        
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
        
        albums3CollectionView.collectionViewLayout = layout
        albums3CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums3CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}


extension Albums3TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums3CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
}
