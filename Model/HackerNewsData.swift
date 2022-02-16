//
//  HackerNewsData.swift
//  H4R News
//
//  Created by Santhosh Kumar on 14/12/21.
//

import Foundation
struct Results: Decodable{
    let hits: [Posts]
}
struct Posts: Decodable, Identifiable{
    var id:String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
