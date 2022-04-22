//
//  VideoRow.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import SwiftUI

struct VideoRow: View {
    
    @ObservedObject var videoPreview: VideoPreview
    @State private var isPresenting = false
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        Button {
            // 디테일뷰 출력
            isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                
                // 썸네일 이미지 출력
                GeometryReader { geo in
                    // 비디오 프리뷰 데이터로 이미지 만들기
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        // 프레임 가로세로 비율설정
                        .frame(width: geo.size.width, height: geo.size.width * 9 / 16)
                        .clipped()
                        .onAppear {
                            // 이미지 높이 업데이트
                            imageHeight = geo.size.width * 9 / 16
                        }
                }
                // 지오메트리 리더 높이 명시적으로 설정
                .frame(height: imageHeight)
                
                // 비디오타이틀 출력
                Text(videoPreview.title)
                    .bold()
                
                // 날짜 출력
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
            
        }
        .sheet(isPresented: $isPresenting) {
            // 비디오 디테일뷰 출력 
            VideoDetail(video: videoPreview.video)
        }

    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
