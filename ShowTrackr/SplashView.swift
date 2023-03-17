//
//  ContentView.swift
//  Entertainment Tracker
//
//  Created by Aditya Nair on 1/9/23.
//

import SwiftUI

extension String
{
    subscript(offset: Int) -> Character
    {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct SplashView: View
{
    @State var test: CGFloat = 0
    @State var val: Bool = false

    //Typewriter Variables
    @State var PreLeftTicketText = ""
    @State var PreRightTicketText = ""
    @State var PreMiddleTicketText = ""
    @State var PreLoginTicketText = ""
    
    //Ticket Path Movement
    @State var leftTicketPathX: CGFloat =  -250  ///aka: leftTicketTextX
    var leftTicketPathY: CGFloat = -142.5        ///aka: leftTicketTextY
    @State var leftTicketPathAndTextPathRotation: Double = -45
    @State var rightTicketPathX: CGFloat = 415   ///aka: rightTicketTextX
    var rightTicketPathY: CGFloat = -182.5       ///aka: rightTicketTextY
    @State var rightTicketPathAndTextPathRotation: Double = 45
    var middleTicketPathX: CGFloat = 170         ///aka: middleTicketTextX
    @State var middleTicketPathY: CGFloat = -170 ///aka: middleTicketTextY
    var loginTicketPathX: CGFloat = 217.5        ///aka: logInTicketTextX
    @State var loginTicketPathY: CGFloat = 7.5   ///aka: logInTicketTextY
    
    //Gradient Timer Variables
    @State var leftGradientTicketPosition = 0.0
    @State var middleGradientTicketPosition = 0.0
    @State var rightGradientTicketPosition = 0.0
    @State var loginGradientTicketPosition = 0.3
    
    //Gradient Timers
    let LeftGradientTicketTimer = Timer.publish(every:0.06,on:.main,in:.common)
        .autoconnect().delay(for:1.3,scheduler:DispatchQueue.main)
    let middleGradientTicketTimer = Timer.publish(every:0.06,on:.main,in:.common)
        .autoconnect().delay(for: 1.7,scheduler:DispatchQueue.main)
    let rightGradientTicketTimer = Timer.publish(every:0.06,on:.main,in:.common)
        .autoconnect().delay(for:2,scheduler:DispatchQueue.main)
    let loginGradientTicketTimer = Timer.publish(every:0.06,on:.main,in:.common)
        .autoconnect().delay(for:2,scheduler:DispatchQueue.main)
    
    @State private var shineStart = false
    
    func loginTicket() -> some View
    {
        HStack{
            let path = TicketView(xSizeFac:1.45,ySizeFac:1.3)
            Button {
                // -------------------------------------
//                withAnimation(.easeInOut(duration:10)){
//                    loginGradientTicketPosition += 0.1
//                    test += 225
//                }
                // -------------------------------------
            } label:{
                path
                    .fill(LinearGradient(gradient: Gradient(stops: [
                        Gradient.Stop(color:.white,location:{ loginGradientTicketPosition-0.25}()),
                        Gradient.Stop(color:Color( #colorLiteral(red: 1, green: 0.9938470721, blue: 0.5436941981, alpha: 1) ),location:{ loginGradientTicketPosition}()),
                        Gradient.Stop(color:.white,location: { loginGradientTicketPosition+0.25}()),
                    ]), startPoint:UnitPoint(x:0.5,y:0),endPoint:UnitPoint(x:0.5,y:1)))
                    .overlay(path.stroke(Color(red:255,green:215,blue:0),lineWidth:2))
                    .rotationEffect(Angle(degrees:90))
//                    .position(x:loginTicketPathX,y:loginTicketPathY)
                    .onAppear {
                        withAnimation(.easeOut(duration:1.5))
                        {
                            self.loginTicketPathY += 395
                        }
                    }
            }
            .position(CGPoint(x:loginTicketPathX, y:loginTicketPathY))
            .buttonStyle(BounceButtonStyle())
            Text(PreLoginTicketText)
                .modifier(SmallText(offsetX:loginTicketPathX-307.5,
                                    offsetY:loginTicketPathY-367.5))
                .onAppear {
                    LogInTicketTextTypeWriter(txtSpeed:0.05,strTime:1.9,txt:"Log in with Google")
                }
        }
    }
    func leftTicket() -> some View
    {
        HStack
        {
            let path = TicketView(xSizeFac:1.9,ySizeFac:1.3)
            path ///The left ticket
                .fill(
                    LinearGradient(gradient:Gradient(stops:[
                        Gradient.Stop(color:.white,location:leftGradientTicketPosition-0.25),
                        Gradient.Stop(color:Color( #colorLiteral(red: 1, green: 0.9938470721, blue: 0.5436941981, alpha: 1) ),location:leftGradientTicketPosition),
                        Gradient.Stop(color:.white,location: leftGradientTicketPosition+0.25),
                    ]), startPoint:UnitPoint(x:0.5,y:0),endPoint:UnitPoint(x:0.5,y:1))
                )
                .overlay(path.stroke(Color(red:255,green:215,blue:0),lineWidth:2))
                .rotationEffect(.degrees(leftTicketPathAndTextPathRotation),
                                anchor: UnitPoint(x:0.5,y:0.5))
                .offset(x:leftTicketPathX,y:leftTicketPathY)
                .onAppear
                {
                    withAnimation(.easeOut(duration:1.75))
                    {
                        self.leftTicketPathAndTextPathRotation += 365
                        self.leftTicketPathX += 250
                    }
                }
                .onReceive(LeftGradientTicketTimer)
                {
                    time in
                        leftGradientTicketPosition += 0.05
                }
            Text(PreLeftTicketText)
                .modifier(LargeText(offsetX:leftTicketPathX-245,
                                    offsetY:leftTicketPathY+175,
                                    rotation: leftTicketPathAndTextPathRotation+90))
                .onAppear {
                    LeftTicketTextTypeWriter(txtSpeed:0.1,strTime:1.5,txt:"Movies")
                }
        }
    }
    
    func rightTicket() -> some View
    {
        HStack
        {
            let path = TicketView(xSizeFac:1.9,ySizeFac:1.3)
            path ///The right ticket
                .fill(
                    LinearGradient(gradient: Gradient(stops:[
                        Gradient.Stop(color:.white,location:rightGradientTicketPosition-0.25),
                        Gradient.Stop(color: Color( #colorLiteral(red: 1, green: 0.9938470721, blue: 0.5436941981, alpha: 1) ), location: rightGradientTicketPosition),
                        Gradient.Stop(color:.white,location: rightGradientTicketPosition+0.25),
                    ]), startPoint:UnitPoint(x:0.5,y:0),endPoint:UnitPoint(x:0.5,y:1))
                )
                .overlay(path.stroke(Color(red:255,green:215,blue:0),lineWidth:2))
                .rotationEffect(.degrees(rightTicketPathAndTextPathRotation),
                                anchor: UnitPoint(x:0.5,y:0.5))
                .offset(x:rightTicketPathX,y:rightTicketPathY)
                .onAppear
                {
                    withAnimation(.easeOut(duration:1.75))
                    {
                        self.rightTicketPathAndTextPathRotation -= 365
                        self.rightTicketPathX -= 250
                    }
                }
                .onReceive(rightGradientTicketTimer)
                {
                    time in
                        rightGradientTicketPosition += 0.05
                }
            Text(PreRightTicketText)
                .modifier(LargeText(offsetX: rightTicketPathX-40,
                                    offsetY: rightTicketPathY+70,
                                    rotation: rightTicketPathAndTextPathRotation-90))
                .onAppear {
                    RightTicketTextTypeWriter(txtSpeed:0.1,strTime:2.25,txt:"Anime")
                }
        }
    }
    func middleTicket() -> some View
    {
        HStack
        {
            let path = TicketView(xSizeFac:1.9,ySizeFac:1.3)
            path ///The middle ticket
                .fill(
                    LinearGradient(gradient:Gradient(stops:[
                        Gradient.Stop(color:.white,location:middleGradientTicketPosition-0.25),
                        Gradient.Stop(color: Color( #colorLiteral(red: 1, green: 0.9938470721, blue: 0.5436941981, alpha: 1) ),location:middleGradientTicketPosition),
                        Gradient.Stop(color:.white,location:middleGradientTicketPosition+0.25),
                    ]), startPoint:UnitPoint(x:0.5,y:0),endPoint: UnitPoint(x:0.5,y:1) )
                )
                .overlay(path.stroke(Color(red:255,green:215,blue:0),lineWidth:2))
                .rotationEffect(Angle(degrees:0))
                .position(x:middleTicketPathX,y:middleTicketPathY)
                .onAppear
                {
                    withAnimation(.easeOut(duration:1.5))
                    {
                        self.middleTicketPathY += 395
                    }
                }
                .onReceive(middleGradientTicketTimer)
                {
                    time in
                        middleGradientTicketPosition += 0.05
                }
            Text(PreMiddleTicketText)
                .modifier(LargeText(offsetX:middleTicketPathY-365,
                                    offsetY:middleTicketPathX-75,
                                    rotation:90))
                .onAppear
                {
                    MiddleTicketTextTypeWriter(txtSpeed:0.1,strTime:1.9,txt:"Shows")
                }
        }
    }
    
    var body: some View{
        ZStack{
            leftTicket()
            rightTicket()
            middleTicket()
            loginTicket()
        }
        .background(Color.black)
    }
}

struct BounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct SplashView_Previews:PreviewProvider{
    static var previews:some View{
        SplashView()
    }
}
