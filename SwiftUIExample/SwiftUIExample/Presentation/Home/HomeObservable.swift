//
//  HomeObservable.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation
import Combine

class HomeObservable: ObservableObject {
    @Published var homeState = HomeState()
    let sideEffect = PassthroughSubject<HomeSideEffect, Never>()
    
    @Inject var getUsersUseCase: GetUsersUseCase
    
    init() {
        loadMoreUsers()
    }
    
    func loadMoreUsers() {
        getUsersUseCase.execute(page: homeState.currentPage){ [weak self] result in
            DispatchQueue.main.async {
                self?.homeState.currentPage += 1
                self?.homeState.friendList += result
            }
        }
    }
    
    func navigateToDetail(id: Int) {
        sideEffect.send(HomeSideEffect.navigateToDetail(id: id))
    }
}
