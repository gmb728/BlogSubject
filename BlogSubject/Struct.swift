//
//  Struct.swift
//  BlogSubject
//
//  Created by Chang Sophia on 2/5/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import Foundation
 

struct Chiness: Codable {
    let date: String
   let subject: String
   let author: String
   let type: String
   let popular: String
   
   enum CodingKeys: String, CodingKey {
      case date = "日期"
      case subject = "文章標題"
      case author = "作者"
      case type = "分類"
      case popular = "人氣"
   }
}
