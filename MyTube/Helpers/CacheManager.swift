//
//  CacheManager.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import Foundation


// CacheManager : 로드된 비디오 프리뷰에 대한 데이터를 저장하므로, 뷰가 스크롤될 때마다 썸네일 이미지데이터를 다운로드하지 않음
class CacheManager {
    
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        // URL을 키로 해서 이미지데이터 저장 
        // 이미 nil인 경우에도 딕셔너리에 있는 이 키를 데이터로 설정함
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        // 저장된 URL 데이터 가져오기 시도
        return cache[url]
    }
}
