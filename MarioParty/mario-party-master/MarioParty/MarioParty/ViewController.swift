//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

struct Player{
    var name: String
    var image: UIImage
    var sound: String
    var bg: UIImage
}
var selectedPlayer: Player?


class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    
    var players: [Player] =
        [
            Player(name: "Mario", image: #imageLiteral(resourceName: "Mario"), sound: "MARIO_3", bg: #imageLiteral(resourceName: "MarioBG")),
            Player(name: "Luigi", image: #imageLiteral(resourceName: "luigi"), sound: "LUIGI_3", bg: #imageLiteral(resourceName: "LuigiBG")),
            Player(name: "Peach", image: #imageLiteral(resourceName: "peach"), sound: "PEACH_3", bg: #imageLiteral(resourceName: "PeachBG")),
            Player(name: "Yoshi", image: #imageLiteral(resourceName: "yoshi"), sound: "YOSHI_2", bg: #imageLiteral(resourceName: "YoshiBG")),
            Player(name: "Waluigi", image: #imageLiteral(resourceName: "waluigi"), sound: "WALUIGI_3", bg: #imageLiteral(resourceName: "WaluigiBG"))
    ]
    
    
    // var counter = 0
    
    @IBOutlet weak var Characterimage: UIImageView!
    
    @IBAction func ClickButton(_ sender: Any) {
        
        let randomPlayer = players.randomElement()!
        selectedPlayer = randomPlayer
        Characterimage.image = randomPlayer.image
        print(randomPlayer.name)
        playMusic(musicName: randomPlayer.sound, type: "WAV")
        //counter += 1
        
    }
    
    func playMusic(musicName: String, type: String)
    {
        let AssortedMusics = URL(fileURLWithPath: Bundle.main.path(forResource: musicName, ofType: type)!)
        audioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics)
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = 0
        audioPlayer.volume = 0.5
        audioPlayer.play()
    }  
}





