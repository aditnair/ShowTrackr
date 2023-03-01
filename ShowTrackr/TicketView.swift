//
//  TicketView.swift
//  Entertainment Tracker
//
//  Created by Aditya Nair on 1/10/23.
//

import SwiftUI

//The Ticket Template
struct TicketView: Shape {
    var xSizeFac: CGFloat
    var ySizeFac: CGFloat
    init(xSizeFac: CGFloat, ySizeFac: CGFloat) {
        self.xSizeFac = xSizeFac
        self.ySizeFac = ySizeFac
    }
    var radius: CGFloat = 25
    var height: CGFloat = 100
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX,
                             y: rect.midY)
        path.addArc(center: CGPoint(x:center.x*xSizeFac,y:center.y/ySizeFac),
                    radius: radius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 90),
                    clockwise: true)
        path.addArc(center: CGPoint(x:center.x*xSizeFac,y:center.y*ySizeFac),
                    radius: radius,
                    startAngle: Angle(degrees: 270),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        path.addArc(center: CGPoint(x:center.x/ySizeFac,y:center.y*ySizeFac),
                    radius: radius,
                    startAngle: Angle(degrees: 360),
                    endAngle: Angle(degrees: 270),
                    clockwise: true)
        path.addArc(center: CGPoint(x:center.x/ySizeFac,y:center.y/ySizeFac),
                    radius: radius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 0),
                    clockwise: true)
        path.closeSubpath()
        return path
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
        {
            TicketView(xSizeFac: 1.25, ySizeFac: 1.25)
        }
    }
}
