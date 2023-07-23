//
//  SwiftUIView.swift
//  slot-machine
//
//  Created by Telles Ivan on 7/20/23.
//
import SwiftUI

struct Hexagonal: Shape {
   func path(in rect: CGRect) -> Path {
      return Path { path in
         let shareableCGPointHeight = rect.height - 20
         let shareableCGPointWidth = rect.width / 2
         
         let pointOne = CGPoint(x: 0, y: 20)
         let pointTwo = CGPoint(x: 0, y: shareableCGPointHeight)
         let pointThree = CGPoint(x: shareableCGPointWidth, y: rect.height)
         let pointFour = CGPoint(x: rect.width, y: shareableCGPointHeight)
         let pointFive = CGPoint(x: rect.width, y: 20)
         let pointSix = CGPoint(x: shareableCGPointWidth, y: 0)
         
         path .move(to: pointSix)
         
         path.addArc(tangent1End: pointOne, tangent2End: pointTwo, radius: 15)
         path.addArc(tangent1End: pointTwo, tangent2End: pointThree, radius: 15)
         path.addArc(tangent1End: pointThree, tangent2End: pointFour, radius: 15)
         path.addArc(tangent1End: pointFour, tangent2End: pointFive, radius: 15)
         path.addArc(tangent1End: pointFive, tangent2End: pointSix, radius: 15)
         path.addArc(tangent1End: pointSix, tangent2End: pointOne, radius: 15)
         
      }
   }
}

#Preview {
   Hexagonal()
      .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120, alignment: .center)
}
