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
            .map {
                users in users.data.map { $0.entity }
            }
            .sink{ completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { friends in
                completion(friends)
            }.store(in: &subscriptions)
    }
    
    public func getUser(id: Int, completion: @escaping (Friend) -> Void) {
        reqresApi.getUser(id: id)
            .map {
                user in user.data.entity
            }
            .sink{ completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { friend in
                completion(friend)
            }.store(in: &subscriptions)
    }
}
