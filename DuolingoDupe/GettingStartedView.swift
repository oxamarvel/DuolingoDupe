//
//  GetStartedView.swift
//  DuolingoDupe
//
//  Created by Oxa Marvel on 17/04/25.
//

import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        VStack {
            VStack() {
                Image(systemName: "bird")
                    .resizable()
                    .scaledToFit()
                Text("Learn for FREE. FOREVER!")
                    .bold()
            }
            
//            Spacer()
            
            VStack {
                NavigationLink(destination: OnboardingView()){
                    Text("Get Started")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {}){
                    Text("I Already Have an Account")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GettingStartedView()
}
