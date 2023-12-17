//
//  DimView.swift
//  TodayLook
//
//  Created by 0ofKim on 2023/12/17.
//

import SwiftUI

struct DimView: View {
    var alpha: CGFloat
    
    var body: some View {
        EmptyView()
            .frame(width: 300, height: 300)
            .background(.red)
    }
}

#Preview {
    DimView(alpha: 0)
}
