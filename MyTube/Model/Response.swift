//
//  Response.swift
//  MyTube
//
//  Created by Mila on 2022/04/22.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        // 1. CodingKeys에 의해 키가 지정된 디코딩 컨테이너에 엑세스.
        // 이건 기본적으로 이 컨테이너에서 밑줄 친 속성에 접근할 수 있게 해줄 것이고 우리는 그것으로 구조체를 초기화 가능
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 2. 이 'items' 키에서 비디오 자체의 배열로 디코딩할 수 있는 모든 항목에 이 항목 속성을 할당
        // 그래서 이것은 비디오 자체를 디코딩할 수 있기 때문에 사용할 것. Docoder 메서드의 비디오를 사용하여 이러한 비디오를 만든 다음 배열을 채우고 여기에서 이 항목 속성에 할당.
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
