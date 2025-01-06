//
//  UserRepository.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

public protocol UserRepository {
    func getUsers(page: Int, completion: @escaping ([Friend]) -> Void)
    func getUser(id: Int, completion: @escaping (Friend) -> Void)
}
