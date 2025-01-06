//
//  UserContainer.swift
//  SwiftUIExample
//
//  Created by 우상욱 on 1/7/25.
//

import SwiftUI
import Kingfisher

struct UserContainer: View {
    var url: String
    var id: Int
    var name: String
    var email: String
    
    var onTap: (Int) -> Void = { id in  }
    
    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: url))
                .cancelOnDisappear(true)
                .placeholder{
                    Image(systemName: "list.dash")
                }
                .resizable()
                .frame(width: 156, height: 156, alignment: .leading)
                .cornerRadius(20)
                .shadow(radius: 5)
            Spacer()
            VStack(alignment: .center, spacing: 2) {
                Text(name)
                    .font(.title3)
                    .padding(.trailing, 8)
                Text(email)
                    .font(.caption)
                    .lineSpacing(0)
                    .cornerRadius(10)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .onTapGesture {
            onTap(id)
        }
    }
}

#Preview {
    UserContainer(url: "https://reqres.in/img/faces/7-image.jpg", id: 1, name: "woo sangwook", email: "sangwook123@gmail.com")
}
