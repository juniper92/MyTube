//
//  Home.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import SwiftUI

let backgroundColor = Color(red: 31 / 255, green: 33 / 255, blue: 36 / 255)


struct Home: View {
    
    @StateObject var model = VideoModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(model.videos, id: \.videoId) { video in
                    // 비디오 행 출력
                    VideoRow(videoPreview: VideoPreview(video: video))
                        .padding()
                }
            }
            .padding(.top, 20)
        }
        .foregroundColor(.white)
        .background(backgroundColor.ignoresSafeArea(.all))
        .animation(.easeOut)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
