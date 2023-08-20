//
//  First.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 17.08.2023.
//

import Foundation

class PlayList {
    var playList_Id:Int?
    var playList_Image:String?
    var playList_Name:String?
    
    init(playList_Id: Int, playList_Image: String?, playList_Name: String?) {
        self.playList_Id = playList_Id
        self.playList_Image = playList_Image
        self.playList_Name = playList_Name
    }
}
