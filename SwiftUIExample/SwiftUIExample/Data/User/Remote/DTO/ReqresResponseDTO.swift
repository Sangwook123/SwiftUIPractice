//
//  ReqresResponseDTO.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation

public struct ReqresUsersResponseDTO: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

public struct ReqresUserResponseDTO: Codable {
    let data: User
    let support: Support
}

public struct User: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

public struct Support: Codable {
    let url: String
    let text: String
}



extension User {
    var entity: Friend {
        Friend(id: id, name: firstName + " " + lastName, email: email, imageURL: avatar)
    }
}
