//
//  TeamViewCell.swift
//  Football Teams App
//
//  Created by Jose Manuel Malagón Alba on 19/1/25.
//

import SwiftUI

struct TeamViewCell: View {
    
    // MARK: - Properties
    let name: String
    let gender: String
    let shortCode: String
    let image: String
    let yearFounded: String
    let lastGameDate: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "celticImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            Text(name + " (\(shortCode))")
                .font(.headline)
            Text("\(gender), \(yearFounded)")
            Text(self.lastGameDate.split(separator: "-").first ?? "")
            Text("Último encuentro: \(lastGameDate)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(16)
    }
}

#Preview {
    TeamViewCell(name: "Celtico",
                 gender: "male",
                 shortCode: "CEL",
                 image: "celticImage",
                 yearFounded: "1888",
                 lastGameDate: "2023-08-01 18:30:00")
}
