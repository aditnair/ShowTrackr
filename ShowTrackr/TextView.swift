//
//  TextView.swift
//  Entertainment Tracker
//
//  Created by Aditya Nair on 1/10/23.
//

import SwiftUI

//Helps creates the small text.
struct SmallText: ViewModifier {
    var offsetX: CGFloat
    var offsetY: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(Font.custom("CourierPrime-Regular",size:15))
            .foregroundColor(.black)
            .rotationEffect(Angle(degrees: 0))
            .lineLimit(nil)
            .offset(x: offsetX, y: offsetY)
    }
}
//Helps creates the large text.
struct LargeText: ViewModifier {
    var offsetX: CGFloat
    var offsetY: CGFloat
    var rotation: CGFloat
    func body(content:Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(Font.custom("Limelight-Regular",size:25))
            .foregroundColor(.black)
            .lineLimit(nil)
            .offset(x: offsetX, y: offsetY)
            .rotationEffect(.degrees(rotation),
                            anchor: UnitPoint(x:0.5,y:0.5))
    }
}
