//
//  OnboardView.swift
//  DuolingoDupe
//
//  Created by Oxa Marvel on 17/04/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isFirstViewPresented = true
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width:30)
                            .foregroundColor(.gray)
                            .padding()
                    }
                    
                    Spacer()
                }
                
                ZStack{
                    SpeechBubble(cornerRadius: 30, isBottom: true, pointLocation: 50)
                        .fill(Color.blue)
                    Text(isFirstViewPresented ? Texts.onboardingText1 : Texts.onboardingText2)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(width: isFirstViewPresented ? 200 : 300, height: 100)
                
                Image(isFirstViewPresented ? Images.onboardingImage1 : Images.onboardingImage2)
                    .scaledToFit()
                
                Button(action: {
                    isFirstViewPresented = false
                }){
                    Text("Continue")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct SpeechBubble: Shape {
    let cornerRadius : CGFloat
    let isBottom : Bool
    let pointLocation : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+cornerRadius, y: rect.minY))
                
        path.addArc(center: CGPoint(x: rect.minX+cornerRadius, y: rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-cornerRadius))
        
        path.addArc(center: CGPoint(x: rect.minX+cornerRadius, y: rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        
        if (isBottom) {
            path.addLine(to: CGPoint(x: pointLocation-10, y: rect.maxY))
            path.addLine(to: CGPoint(x: pointLocation, y: rect.maxY+10))
            path.addLine(to: CGPoint(x: pointLocation+10, y: rect.maxY))
        }
        
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+cornerRadius))
        
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius, y: rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)

        
        return path
    }
}

#Preview {
    OnboardingView()
}
