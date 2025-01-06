//
//  DIContainer+.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

extension DIContainer {
    func registerDependency() {
        DIContainer.shared.register(type: ReqresApiProtocol.self){
            ReqresAPI()
        }
        
        DIContainer.shared.register(type: UserRepository.self){
            DefaultUserRepository()
        }
        
        DIContainer.shared.register(type: GetUserUseCase.self){
            GetUserUseCase()
        }
        
        DIContainer.shared.register(type: GetUsersUseCase.self){
            GetUsersUseCase()
        }
    }
}
