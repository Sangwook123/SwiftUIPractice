//
//  DetailObservable.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import Foundation
import Combine

class DetailObservable: ObservableObject {
    @Published var detailState: DetailState
    let sideEffect = PassthroughSubject<DetailSideEffect, Never>()
    
    @Inject var getUserUseCase: GetUserUseCase
    
    init(id: Int){
        self.detailState = DetailState(selectedUserId: id)
        loadUser(id: id)
    }
    
    func loadUser(id: Int){
        getUserUseCase.execute(id: id){ [weak self] result in
            DispatchQueue.main.async {
                self?.detailState.name = result.name
                self?.detailState.email = result.email
                self?.detailState.imageURL = result.imageURL
            }
        }
    }
    
    func popBack() {
        sideEffect.send(.popBack)
    }
}
