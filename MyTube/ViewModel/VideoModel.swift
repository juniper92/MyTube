//
//  VideoModel.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import Foundation
import Alamofire

// VideoModel: 선택한 플리의 비디오를 검색하기 위해, 플리의 엔드포인트에 요청 보냄
class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        
        // url 객체 생성
        guard let url = URL(string: "\(Constants.API_URL)/playlistItems") else { return }
//        guard let url = URL(string: "\(Constants.API_URL)/search") else { return }
        
        // get decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // url 요청 생성
//        AF.request(
//            url,
//            parameters: ["part": "snippet", "playlistId": Constants.PLAYLIST_ID, "key": Constants.API_KEY]
//        )
        AF.request(
            url,
            parameters: ["part": "id", "videoId": Constants.CHANNEL_ID, "key": Constants.API_KEY]
        )
        .validate()
        .responseDecodable(of: Response.self, decoder: decoder) { response in
            
            // 요청 성공여부 확인
            switch response.result {
                
            case .success:
                break
                
            case .failure(let error) :
                // 요청이 실패하면 에러로그 띄우고 아무것도 하지 않기
                print(error.localizedDescription)
                return
            }
            
            // ui 업데이트
            if let items = response.value?.items {
                DispatchQueue.main.async {
                    self.videos = items
                }
            }
        }
    }
}
