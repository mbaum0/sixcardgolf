//
//  CardView.swift
//  Golf
//
//  Created by Michael Baumgarten on 10/12/21.
//

import SwiftUI

struct CardView: View {
    @Binding var faceup:Bool
    var faceimg:String
    var backimg:String

    var body: some View {
        
        VStack {
            if faceup {
                Image(faceimg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:75)
                .scaleEffect(CGSize(width: -1.0, height: 1.0))
            } else {
                Image(backimg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:75)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(faceup: Binding.constant(true), faceimg:"back", backimg: "back")
    }
}
