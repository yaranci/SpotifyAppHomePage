//
//  Albums7TableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 20.08.2023.
//

import UIKit

class Albums7TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var albums7Label: UILabel!
    @IBOutlet weak var albums7CollectionView: UICollectionView!
    
    var albumList = [Albums]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albums7CollectionView.delegate = self
        albums7CollectionView.dataSource = self
        albums7CollectionView.backgroundColor = .black
        
        let a1 = Albums(albums_Id: 1, albums_Image: "nutuk", albums_Singer: "Her Gün 10 Dakika Nutuk")
        let a2 = Albums(albums_Id: 2, albums_Image: "merdiven", albums_Singer: "Bir valiz Yüzünden Ağlanır mı ?")
        let a3 = Albums(albums_Id: 3, albums_Image: "dogan", albums_Singer: "Yaşam ve Değerler Üstüne Seminer • Doğan Cüceloğlu")
        let a4 = Albums(albums_Id: 4, albums_Image: "cahil", albums_Singer: "Cahille Sohbeti Kestim- Einstein'ın Türkiye'ye Sığınma Talebi")
        let a5 = Albums(albums_Id: 5, albums_Image: "eng", albums_Singer: "English Listening - Vacations")
        let a6 = Albums(albums_Id: 6, albums_Image: "wil", albums_Singer: "Willowbrook Village - Lovely English Stories")
        let a7 = Albums(albums_Id: 7, albums_Image: "meksika", albums_Singer: "Meksika Açmazı 077")
        
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
        
        albums7CollectionView.collectionViewLayout = layout
        albums7CollectionView.isPagingEnabled = true
    }
    
    
    func customNibs() {
        let albums1CollectionCellNib:UINib = UINib(nibName: "Albums1CollectionViewCell", bundle: nil)
        albums7CollectionView.register(albums1CollectionCellNib, forCellWithReuseIdentifier: "Albums1CollectionViewCell")
    }
    
}


extension Albums7TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = albums7CollectionView.dequeueReusableCell(withReuseIdentifier: "Albums1CollectionViewCell", for: indexPath) as? Albums1CollectionViewCell {
            let album = albumList[indexPath.row]
            cell.albumLabel.text = album.albums_Singer
            cell.albumImage.image = UIImage(named: album.albums_Image!)
            return cell
        }
        return UICollectionViewCell()
    }
}

