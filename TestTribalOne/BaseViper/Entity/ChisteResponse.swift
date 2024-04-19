//
//  ChisteResponse.swift
//  TestTribalOne
//
//  Created by Diego on 19/04/24.
//

import Foundation

struct ChisteResponse: Decodable {
    let iconURL: String
    let id: String
    let url: String?
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case iconURL = "icon_url"
        case id
        case url
        case value
    }
}

//
//{
//"icon_url" : "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
//"id" : "XvhvQJ7JRhG_uSo7-bXLdA",
//"url" : "",
//"value" : "Chuck Norris was once caught without a ticket on the train. The inspector was fined $110."
//}
