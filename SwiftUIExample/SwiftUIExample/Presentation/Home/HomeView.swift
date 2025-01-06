//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: RouterRegistry
    @StateObject var homeObservable: HomeObservable = HomeObservable()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Array(homeObservable.homeState.friendList.enumerated()), id: \.element.id) { index, friend in
                    UserContainer(
                        url: friend.imageURL,
                        id: friend.id,
                        name: friend.name,
                        email: friend.email
                    ){ id in
                        homeObservable.navigateToDetail(id: id)
                    }
                    .onAppear {
                        if index == homeObservable.homeState.friendList.count - 1 {
                            homeObservable.loadMoreUsers()
                        }
                    }
                }
            }
        }.onReceive(homeObservable.sideEffect){ sideEffect in
            switch sideEffect {
            case .navigateToDetail(id: let id):
                router.navigate(to: .detail(id: id))
            }
        }
    }
}

