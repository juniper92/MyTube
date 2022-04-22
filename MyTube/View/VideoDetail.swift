//
//  VideoDetail.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import SwiftUI

struct VideoDetail: View {
    
    var video: Video
    var date: String {
        // 비디오 날짜 형식지정
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: video.published)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            // 비디오타이틀
            Text(video.title)
                .bold()
            
            // 날짜
            Text(date)
                .foregroundColor(.gray)
            
            // 비디오 출력
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1280, height: 720), contentMode: .fit)
            
            // 비디오 설명 
            ScrollView {
                Text(video.description)
            }
        }
        .font(.system(size: 19))
        .padding()
        .padding(.top, 40)
        .background(backgroundColor.ignoresSafeArea(.all))
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
