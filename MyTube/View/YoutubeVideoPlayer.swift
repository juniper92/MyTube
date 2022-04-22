//
//  YoutubeVideoPlayer.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = WKWebView()
        
        view.backgroundColor = UIColor(backgroundColor)
        
        // 비디오 url
        let embedUrlString = Constants.YOUTUBE_EMBED_URL + video.videoId
        
        // 웹뷰로 비디오 로드
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        // 웹뷰리턴
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
