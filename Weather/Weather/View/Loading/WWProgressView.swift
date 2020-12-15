//
//  WWProgressView.swift
//  Weather
//
//  Created by Kevin Paul on 12/15/20.
//

import SwiftUI

struct WWProgressView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.secondary))
                .scaleEffect(2.0)
        }
    }
}

struct WWProgressView_Previews: PreviewProvider {
    static var previews: some View {
        WWProgressView()
    }
}
