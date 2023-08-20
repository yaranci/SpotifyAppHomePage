//
//  ViewController.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 13.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
    func customNibs() {
        let playListCustomCellNib:UINib = UINib(nibName: "PlayListTableViewCell", bundle: nil)
        homeTableView.register(playListCustomCellNib, forCellReuseIdentifier: "PlayListTableViewCell")
        
        let albums1CustomCellNib:UINib = UINib(nibName: "Albums1TableViewCell", bundle: nil)
        homeTableView.register(albums1CustomCellNib, forCellReuseIdentifier: "Albums1TableViewCell")
        
        let albums2CustomCellNib:UINib = UINib(nibName: "Albums2TableViewCell", bundle: nil)
        homeTableView.register(albums2CustomCellNib, forCellReuseIdentifier: "Albums2TableViewCell")
        
        let albums3CustomCellNib:UINib = UINib(nibName: "Albums3TableViewCell", bundle: nil)
        homeTableView.register(albums3CustomCellNib, forCellReuseIdentifier: "Albums3TableViewCell")
        
        let albums4CustomCellNib:UINib = UINib(nibName: "Albums4TableViewCell", bundle: nil)
        homeTableView.register(albums4CustomCellNib, forCellReuseIdentifier: "Albums4TableViewCell")
        
        let albums5CustomCellNib:UINib = UINib(nibName: "Albums5TableViewCell", bundle: nil)
        homeTableView.register(albums5CustomCellNib, forCellReuseIdentifier: "Albums5TableViewCell")
        
        let albums6CustomCellNib:UINib = UINib(nibName: "Albums6TableViewCell", bundle: nil)
        homeTableView.register(albums6CustomCellNib, forCellReuseIdentifier: "Albums6TableViewCell")
        
        let albums7CustomCellNib:UINib = UINib(nibName: "Albums7TableViewCell", bundle: nil)
        homeTableView.register(albums7CustomCellNib, forCellReuseIdentifier: "Albums7TableViewCell")
    }


}



//MARK: TableView Delegate Methods
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.frame.height
        switch indexPath.section {
        case 0:
            return height * 0.25
        default:
            return 300
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            if let cell = Bundle.main.loadNibNamed("PlayListTableViewCell", owner: self, options: nil)?.first as? PlayListTableViewCell{
                return cell
            }
        case 1:
            /*if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Albums1TableViewCell", for: indexPath) as? Albums1TableViewCell {
             cell2.albums1Label.text = "Kaldığın yerden devam et"
             return cell2
             }
             }*/
            if let cell1 = Bundle.main.loadNibNamed("Albums1TableViewCell", owner: self, options: nil)?.first as? Albums1TableViewCell{
                cell1.albums1Label.text = "Kaldığın yerden devam et"
                return cell1
            }
        case 2:
            if let cell2 = Bundle.main.loadNibNamed("Albums2TableViewCell", owner: self, options: nil)?.first as? Albums2TableViewCell{
                cell2.album2Label.text = "Ebru için düzenlendi"
                return cell2
            }
        case 3:
            if let cell3 = Bundle.main.loadNibNamed("Albums3TableViewCell", owner: self, options: nil)?.first as? Albums3TableViewCell{
                cell3.albums3Label.text = "En çok dinlediğin mixler"
                return cell3
            }
        case 4:
            if let cell4 = Bundle.main.loadNibNamed("Albums4TableViewCell", owner: self, options: nil)?.first as? Albums4TableViewCell{
                cell4.albums4Label.text = "Ruh Hali"
                return cell4
            }
        case 5:
            if let cell5 = Bundle.main.loadNibNamed("Albums5TableViewCell", owner: self, options: nil)?.first as? Albums5TableViewCell{
                cell5.albums5Label.text = "En sevdiğin sanatçılar"
                //cell5.albums5Label.textAlignment = .center
                return cell5
            }
        case 6:
            if let cell6 = Bundle.main.loadNibNamed("Albums6TableViewCell", owner: self, options: nil)?.first as? Albums6TableViewCell{
                cell6.albums6Label.text = "Yakınlarda Çalınanlar"
                //cell5.albums5Label.textAlignment = .center
                return cell6
            }
        case 7:
            if let cell7 = Bundle.main.loadNibNamed("Albums7TableViewCell", owner: self, options: nil)?.first as? Albums7TableViewCell{
                cell7.albums7Label.text = "Sana özel bölümler"
                return cell7
            }
            
        
           
        default:
            return UITableViewCell()
        }
        
        
        /*if indexPath.section == 0 {
            if let cell = Bundle.main.loadNibNamed("PlayListTableViewCell", owner: self, options: nil)?.first as? PlayListTableViewCell{
                return cell
            }
        }else{
            /*if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Albums1TableViewCell", for: indexPath) as? Albums1TableViewCell {
             cell2.albums1Label.text = "Kaldığın yerden devam et"
             return cell2
             }
             }*/
            if let cell2 = Bundle.main.loadNibNamed("Albums1TableViewCell", owner: self, options: nil)?.first as? Albums1TableViewCell{
                cell2.albums1Label.text = "Kaldığın yerden devam et"
                return cell2
            }
        }*/
        return UITableViewCell()
    }
    
    
}
