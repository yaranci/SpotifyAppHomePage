//
//  PlayListTableViewCell.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 18.08.2023.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var playListCollectionView: UICollectionView!
    
    var playList = [PlayList]()

    override func awakeFromNib() {
        super.awakeFromNib()
        playListCollectionView.delegate = self
        playListCollectionView.dataSource = self
        playListCollectionView.backgroundColor = .black

        let p1 = PlayList(playList_Id: 1, playList_Image: "duman", playList_Name: "Duman")
        let p2 = PlayList(playList_Id: 2, playList_Image: "eminem", playList_Name: "Eminem")
        let p3 = PlayList(playList_Id: 3, playList_Image: "tophitsof2010", playList_Name: "Top Hits of 2010")
        let p4 = PlayList(playList_Id: 4, playList_Image: "sabahkahvesi", playList_Name: "Sabah Kahvesi")
        let p5 = PlayList(playList_Id: 5, playList_Image: "90sdanceparty", playList_Name: "90s Dance Party")
        let p6 = PlayList(playList_Id: 6, playList_Image: "dailymix3", playList_Name: "Daily Mix 3")
        playList.append(p1)
        playList.append(p2)
        playList.append(p3)
        playList.append(p4)
        playList.append(p5)
        playList.append(p6)
        
        customNibs()
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    func configureLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 60)
        
        playListCollectionView.collectionViewLayout = layout
        playListCollectionView.isPagingEnabled = true
        //        let playListWidth = UIScreen.main.bounds.width
        //        let playListHeight = playListCollectionView.bounds.height / 2
    }


    func customNibs(){
        let playListCollectionCellNib:UINib = UINib(nibName: "PlayListCollectionViewCell", bundle: nil)
        playListCollectionView.register(playListCollectionCellNib, forCellWithReuseIdentifier: "PlayListCollectionViewCell")
    }
    }


    extension PlayListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCollectionViewCell", for: indexPath) as? PlayListCollectionViewCell {
            let pList = playList[indexPath.row]
            cell.playListLabel.text = pList.playList_Name
            cell.playListImage.image = UIImage(named: pList.playList_Image!)
            return cell
        }
        return UICollectionViewCell()
    }

    
    
}
