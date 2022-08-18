//
//  PreviewPlayer.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import UIKit
import AVFoundation
import AVKit

class PlayerView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var previewTimer:Timer?
    open var player: AVPlayer?
    var previewLength:Double
    
    init(frame: CGRect, url: URL, previewLength:Double, player: AVPlayer) {
        self.previewLength = previewLength
        self.player = player
        super.init(frame: frame)
        player.allowsExternalPlayback = false
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.black.cgColor
        
        previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { (timer) in
            player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        })
        

        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        self.previewLength = 15
        super.init(coder: coder)
    }
    
    func pause(){
        player?.pause()
    }
    
    func removePlayer(){
        player?.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
        player?.pause()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }

}
