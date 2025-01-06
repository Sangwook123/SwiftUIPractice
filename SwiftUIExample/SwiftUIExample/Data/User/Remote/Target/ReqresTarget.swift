//
//  ReqresTarget.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation
import Combine

import Alamofire

enum ReqresTarget {
    case getUsers(page: Int)
    case getUser(id: Int)
}

public protocol ReqresApiProtocol {
    func getUsers(page: Int) -> AnyPublisher<ReqresUsersResponseDTO, NetworkError>
    func getUser(id: Int) -> AnyPublisher<ReqresUserResponseDTO, NetworkError>
}

extension ReqresTarget: TargetType {
    var baseURL: String {
        return "https://reqres.in"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getUsers: .get
        case .getUser: .get
        }
    }
    var path: String {
        switch self {
        case .getUsers: return "/api/users"
        case .getUser(let userId): return "/api/users/\(userId)"
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .getUsers(let page): .query(ReqresRequestDTO(page: page))
        case .getUser: .none
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
