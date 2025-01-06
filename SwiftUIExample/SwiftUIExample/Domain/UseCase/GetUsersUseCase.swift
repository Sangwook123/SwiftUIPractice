//
//  GetUsersUseCase.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation

public class GetUsersUseCase {
    @Inject var repository: UserRepository
    
    public func execute(page: Int, completion: @escaping ([Friend]) -> Void) {
        repository.getUsers(page: page, completion: completion)
    }
}
