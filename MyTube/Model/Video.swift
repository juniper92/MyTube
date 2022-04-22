//
//  Video.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import Foundation

struct Video: Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case items
        case snippet
        case thumbnails
        case high
        case id
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init() {
        self.videoId = "123455223442"
        self.title = "비디오 타이틀"
        self.description = "비디오 디스크립션 비디오비디오비디오"
        self.thumbnail = "https://i.ytimg.com/vi/wZhJKDvVySA/hqdefault.jpg"
        self.published = Date()
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 아이템 내부의 videoId 파싱
        let itemsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .items)
        
        let idContainer = try itemsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .id)
        
        self.videoId = try idContainer.decode(String.self, forKey: .videoId)
        
        
        // 스니펫 컨테이너
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // title 파싱
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // description 파싱
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // published date 파싱
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        
        // thumbnails 파싱
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        
//        /// videoId 파싱
//        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
//
//        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}


