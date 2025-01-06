//
//  ContentObservable.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/1/25.
//

import Combine

class ContentObservable : ObservableObject {
    @Published var content: String = ""
    let sideEffect: PassthroughSubject<Void, Never> = PassthroughSubject()
}

