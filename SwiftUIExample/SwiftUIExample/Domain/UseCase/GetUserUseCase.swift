//
//  GetUserUseCase.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation

public class GetUserUseCase {
    @Inject var repository: UserRepository
    
    public func execute(id: Int, completion: @escaping (Friend) -> Void) {
        repository.getUser(id: id, completion: completion)
    }
}
