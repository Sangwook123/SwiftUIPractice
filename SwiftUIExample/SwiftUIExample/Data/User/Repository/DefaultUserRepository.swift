//
//  DefaultUserRepository.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation
import Combine

public final class DefaultUserRepository: UserRepository {
    @Inject var reqresApi: ReqresApiProtocol
    var subscriptions = Set<AnyCancellable>()
    
    public func getUsers(page: Int, completion: @escaping ([Friend]) -> Void) {
        reqresApi.getUsers(page: page)
            .sink{ completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { users in
                let friends = users.data.map { user in
                    user.entity
                }
                completion(friends)
            }.store(in: &subscriptions)
    }
    
    public func getUser(id: Int, completion: @escaping (Friend) -> Void) {
        reqresApi.getUser(id: id)
            .sink{ completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { user in
                completion(user.data.entity)
            }.store(in: &subscriptions)
    }
}
