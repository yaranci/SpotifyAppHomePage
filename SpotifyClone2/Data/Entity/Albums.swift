//
//  Second.swift
//  SpotifyClone2
//
//  Created by Yaşar Ebru İmrahor on 17.08.2023.
//

import Foundation



class Albums {
    var albums_Id:Int?
    var albums_Image:String?
    var albums_Singer:String?
    
    init(albums_Id: Int, albums_Image: String, albums_Singer: String) {
        self.albums_Id = albums_Id
        self.albums_Image = albums_Image
        self.albums_Singer = albums_Singer
    }
}
