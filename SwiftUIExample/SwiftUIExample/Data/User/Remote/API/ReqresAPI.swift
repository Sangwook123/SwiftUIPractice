//
//  ReqresAPI.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation
import Combine

struct ReqresAPI: ReqresApiProtocol {
    private let client = SoptClient.shared
    
    func getUsers(page: Int) -> AnyPublisher<ReqresUsersResponseDTO, NetworkError> {
        let target: ReqresTarget = .getUsers(page: page)
        
        return client.request(ReqresUsersResponseDTO.self, target: target)
    }
    
    func getUser(id: Int) -> AnyPublisher<ReqresUserResponseDTO, NetworkError> {
        let target: ReqresTarget = .getUser(id: id)
        
        return client.request(ReqresUserResponseDTO.self, target: target)
    }
}
