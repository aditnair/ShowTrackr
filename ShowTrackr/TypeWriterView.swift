//
//  TypeWriterView.swift
//  Entertainment Tracker
//
//  Created by Aditya Nair on 1/30/23.
//

import Foundation

extension SplashView {
    func LeftTicketTextTypeWriter(txtSpeed:Double,strTime:Double,txt:String,at position:Int=0)
    {
        var letterplacement = txtSpeed
        if position == 0
        {
            PreLeftTicketText = ""
            letterplacement = strTime
        }
        if position < txt.count
        {
            DispatchQueue.main.asyncAfter(deadline:.now()+letterplacement)
            {
                PreLeftTicketText.append(txt[position])
                LeftTicketTextTypeWriter(txtSpeed:txtSpeed,strTime:strTime,txt:txt,at:position+1)
            }
        }
    }
    func RightTicketTextTypeWriter(txtSpeed:Double,strTime:Double,txt:String,at position:Int=0)
    {
        var letterplacement = txtSpeed
        if position == 0
        {
            PreRightTicketText = ""
            letterplacement = strTime
        }
        if position < txt.count
        {
            DispatchQueue.main.asyncAfter(deadline:.now()+letterplacement)
            {
                PreRightTicketText.append(txt[position])
                RightTicketTextTypeWriter(txtSpeed:txtSpeed,strTime:strTime,txt:txt,at:position+1)
            }
        }
    }
    func MiddleTicketTextTypeWriter(txtSpeed:Double,strTime:Double,txt:String,at position:Int=0)
    {
        var letterplacement = txtSpeed
        if position == 0
        {
            PreMiddleTicketText = ""
            letterplacement = strTime
        }
        if position < txt.count
        {
            DispatchQueue.main.asyncAfter(deadline:.now()+letterplacement)
            {
                PreMiddleTicketText.append(txt[position])
                MiddleTicketTextTypeWriter(txtSpeed:txtSpeed,strTime:strTime,txt:txt,at:position+1)
            }
        }
    }
    func LogInTicketTextTypeWriter(txtSpeed:Double,strTime:Double,txt:String,at position:Int=0) {
        var letterplacement = txtSpeed
        if position == 0
        {
            PreLoginTicketText = ""
            letterplacement = strTime
        }
        if position < txt.count
        {
            DispatchQueue.main.asyncAfter(deadline:.now()+letterplacement)
            {
                PreLoginTicketText.append(txt[position])
                LogInTicketTextTypeWriter(txtSpeed:txtSpeed,strTime:strTime,txt:txt,at:position+1)
            }
        }
    }
}
