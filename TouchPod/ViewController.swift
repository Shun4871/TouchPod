//
//  ViewController.swift
//  TouchPod
//
//  Created by 柘植俊之介 on 2024/09/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = songNameArray[indexPath.row]
        
        content.image = UIImage(named: imageNameArray[indexPath.row])
        
        content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
        
        cell.contentConfiguration = content
        
        return cell
    }
    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    var audioPLayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        songNameArray = ["カノン","エリーゼのために","G戦場のアリア"]
        
        //flLeNameArrayに出名を入れていくよ
        fileNameArray = ["cannon", "elise", "aria"]
        //imageNameArrayに名を入れていくよ
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach. jpg"]
        
        table.delegate = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("\(songNameArray [indexPath.row])が選択されました！")
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row],ofType: "mp3")!)
        audioPLayer = try? AVAudioPlayer(contentsOf: audioPath)
        //音楽を再生
        audioPLayer.play ()
    }
    
}
