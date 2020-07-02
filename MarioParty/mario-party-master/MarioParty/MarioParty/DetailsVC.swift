//
//  DetailsVC.swift
//  MarioParty
//
//  Created by lulu rashed on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class DetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var starsImage: UIImageView!
   
    @IBOutlet weak var bgImage: UIImageView!
    
    
  var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer?.name
        bgImage.image = selectedPlayer?.bg
    characterImage.image = selectedPlayer?.image
        
        
        
    }
    @IBAction func button(_ sender: Any) {
        
        let stars = [#imageLiteral(resourceName: "Star1"),#imageLiteral(resourceName: "Star2"),#imageLiteral(resourceName: "Star3"),#imageLiteral(resourceName: "Star4"),#imageLiteral(resourceName: "Star5"),]
        
        starsImage.image = stars.randomElement()
        
        
       }
    @IBAction func music(_ sender: Any) {
        playMusic(musicName: selectedPlayer!.sound, type: "WAV")
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
