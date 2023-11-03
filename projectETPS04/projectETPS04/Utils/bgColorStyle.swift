//
//  bgColorStyle.swift
//  projectETPS04
//
//  Created by Roberto Flores on 2/11/23.
//

import SwiftUI

struct bgColorStyle: View {
    var body: some View {
        Rectangle()
            .fill(Gradient(colors: [.cPink, .cPurple, .cBlue]))
            .ignoresSafeArea()
    }
}

#Preview {
    bgColorStyle()
}
