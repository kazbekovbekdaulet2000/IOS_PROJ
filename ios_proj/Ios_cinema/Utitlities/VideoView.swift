//
//  VideoView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import Foundation
import SwiftUI
import AVKit

struct VideoView: UIViewRepresentable {
        
    var src: URL
    
    @Binding var muted: Bool
    @Binding var pause: Bool
    
    func makeUIView(context: Context) -> PlayerView {
        let player = AVPlayer(url: src)
        player.volume = 0
        player.play()
        
        return PlayerView(frame: .zero, url: src, previewLength: 30, player: player)
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) {
        if(muted){
            uiView.player?.volume = 0
        }else{
            uiView.player?.volume = 1
        }
        
        if(pause){
            uiView.player?.pause()
        }else{
            uiView.player?.play()
        }
        
    }
    
    static func dismantleUIView(_ uiView: PlayerView, coordinator: ()) {
        uiView.removePlayer()
    }
}
