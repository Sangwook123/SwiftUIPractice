//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 12/23/24.
//

import SwiftUI
import Combine

struct MainView: View {
    @EnvironmentObject var router: RouterRegistry
    @StateObject var observable = ContentObservable()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                HomeView().tabItem {
                    Label("홈", systemImage: "house")
                        .font(.title2)
                }
                ChatView().tabItem {
                    Label("채팅", systemImage: "message")
                        .font(.headline)
                }
                MyPageView().tabItem {
                    Label("마이페이지", systemImage: "person")
                        .font(.body)
                        .foregroundColor(.purple)
                }
            }
            .accentColor(.black)
            .padding()
            .navigationDestination(for: Destination.self){ destination in
                switch destination {
                case .chat:
                    ChatView()
                case .home:
                    HomeView()
                case .mypage:
                    MyPageView()
                case .detail(let id):
                    DetailView(id: id)
                }
            }
        }
    }
}

#Preview {
    MainView().environmentObject(
        RouterRegistry()
    )
}
