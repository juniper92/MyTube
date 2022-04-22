//
//  VideoPreview.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject {
    
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    
    init(video: Video) {
        
        // 비디오, 타이틀
        self.video = video
        self.title = video.title
        
        // 날짜
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.date = df.string(from: video.published)
        
        // 이미지데이터 다운로드
        guard video.thumbnail != "" else { return }
        
        // 데이터 다운로드 전 캐시 확인
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            // 썸네일 데이터
            thumbnailData = cachedData
            return
        }
        
        // 썸네일에서 URL 가져오기
        guard let url = URL(string: video.thumbnail) else { return }
        
        // 요청 생성
        AF.request(url).validate().responseData { response in
            
            if let data = response.data {
                
                // 캐시에 데이터 저장
                CacheManager.setVideoCache(video.thumbnail, data)
                
                // 이미지 세팅
                DispatchQueue.main.async {
                    self.thumbnailData = data
                }
            }
        }
    }
}
