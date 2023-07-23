//
//  FinalView.swift
//  slot-machine
//
//  Created by Telles Ivan on 7/22/23.
//

import SwiftUI

struct FinalView: View  {
   public let hexagonHeight: Int =  120
   public let hexagonWidth: Int =  100
   
   @State public var symbols = ["eating", "happy", "love"]
   @State public var numbers = [0,1, 2]
   @State public var counter = 0
   @State private var alertEnabled: Choice?
   

   
   func handleSpinPress() -> Void {
      let range = 0...self.symbols.count - 1
      self.numbers[0] = Int.random(in: range)
      self.numbers[1] = Int.random(in: range)
      self.numbers[2] = Int.random(in: range)
      
      self.counter += 1
      let win = self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
      if win {
         return self.alertEnabled = .success
      }
      if self.counter > 5 {
         return self.alertEnabled = .failure
      }
   }
   
   
   func onPlayAgainPress() -> Void {
      self.counter = 0
      self.numbers[0] = 0
      self.numbers[1] = 1
      self.numbers[2] = 2
   }
   
   var body: some View {
      ZStack(alignment: .center, content: {
         Image("sunshine")
            .resizable()
            .ignoresSafeArea(.all)
         VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80) {
            HStack{
               Image("fire")
                  .resizable()
                  .scaledToFit()
                  .shadow(color: .orange, radius:4)
               Text("Slot Machine")
                  .font(.system(size: 26))
                  .fontWeight(.black)
                  .shadow(color: .orange, radius:2, x:5, y: 3)
               Image("fire")
                  .resizable()
                  .scaledToFit()
                  .shadow(color: .orange, radius:4)
            }
            .frame(width: .infinity, height: 50, alignment: .center)
            VStack(alignment:.center, spacing:20) {
               HStack(alignment: .center, spacing:40){
                  Hexagon()
                     .fill(.white.opacity(0.7))
                     .frame(width: 100, height: 120, alignment: .center)
                     .overlay(
                        Image(symbols[numbers[0]])
                           .resizable()
                           .scaledToFit()
                           .frame(width: 70, height: 70, alignment: .center)
                           .shadow(color: .gray, radius:3, x:4, y: 6)
                     )
                  Hexagon()
                     .fill(.white.opacity(0.7))
                     .frame(width: 100, height: 120, alignment: .center)
                     .overlay(
                        Image(symbols[numbers[1]])
                           .resizable()
                           .scaledToFit()
                           .frame(width: 70, height: 70, alignment: .center)
                           .shadow(color: .gray, radius:3, x:4, y: 6)
                     )
               }
               Hexagon()
                  .fill(.white.opacity(0.7))
                  .frame(width: 100, height: 120, alignment: .center)
                  .overlay(
                     Image(symbols[numbers[2]])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70, alignment: .center)
                        .shadow(color: .gray, radius:3, x:4, y: 6)
                  )
               HStack(alignment: .center, spacing:40){
                  Hexagon()
                     .fill(.white.opacity(0.7))
                     .frame(width: 100, height: 120, alignment: .center)
                     .overlay(
                        Image(symbols[numbers[1]])
                           .resizable()
                           .scaledToFit()
                           .frame(width: 70, height: 70, alignment: .center)
                           .shadow(color: .gray, radius:3, x:4, y: 6)
                     )
                  Hexagon()
                     .fill(.white.opacity(0.7))
                     .frame(width: 100, height: 120, alignment: .center)
                     .overlay(
                        Image(symbols[numbers[0]])
                           .resizable()
                           .scaledToFit()
                           .frame(width: 70, height: 70, alignment: .center)
                           .shadow(color: .gray, radius:3, x:4, y: 6)
                     )
               }
            }
            Button(action: handleSpinPress, label: {
               RoundedRectangle(cornerRadius: 100 )
                  .fill(.white)
                  .overlay(content: {
                     Text("Spin | Tries: \(6 - self.counter)")
                     .fontWeight(.semibold)
                     .foregroundColor(.color)
                     .font(.system(size: 20))
                 } )
                  .frame(width: 200, height: 50, alignment: .center)
               
            })
         }
         .alert(item: $alertEnabled) { alert -> Alert in
            switch(alert) {
               case .success:
                  return Alert(title: Text("YOU WON THE GAME BUDDY!!"), message: Text("heck yeah...."),dismissButton: .cancel(Text("Play again"), action: onPlayAgainPress))
               case .failure:
                  return Alert(title: Text("Limit exceeded"), message: Text("You lost, play again?"),dismissButton: .cancel(Text("Try again"), action: onPlayAgainPress))
            }
         }
      })
   }
}

#Preview {
   FinalView()
}
