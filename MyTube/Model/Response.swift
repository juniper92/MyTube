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
        
        //  CodingKeys에 의해 키가 지정된 디코딩 컨테이너에 엑세스.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
