//
//  DetailView.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import SwiftUI

import Kingfisher

struct DetailView: View {
    let id: Int
    @EnvironmentObject var router: RouterRegistry
    @StateObject var detailObservable: DetailObservable
    
    init(id: Int){
        self.id = id
        self._detailObservable = StateObject(wrappedValue: DetailObservable(id: id))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "arrow.left")
                .padding()
                .frame(alignment: .leading)
                .onTapGesture {
                    detailObservable.popBack()
                }
            KFImage(URL(string: detailObservable.detailState.imageURL))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            Text(detailObservable.detailState.name)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(detailObservable.detailState.email)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }.onReceive(detailObservable.sideEffect) { sideEffect in
            switch sideEffect {
                
            case .popBack:
                router.popBack()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailView(id: 1)
}
