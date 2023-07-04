//
//  ContentView.swift
//  TipCalculator
//
//  Created by Zaid Khan on 2023-07-03.
//

import SwiftUI

struct ContentView: View {
    @State private var amountString = ""
    @State private var amount = 0.0
    @State private var tipPercent = 0.0
    @State private var showTipScreen = false
    @State private var showTotalScreen = false
    @State private var showFirstScreenContents = true
    
    private let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
    }
    
    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .ignoresSafeArea()
            if showFirstScreenContents {
                VStack {
                    VStack {
                        TextField("$0.00", text: $amountString)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .onChange(of: amountString) { newValue in
                                amount = Double(newValue) ?? 0.0
                            }
                            .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                        
                        Button(action: {
                            showTipScreen = true
                        }) {
                            VStack {
                                Text("Next")
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                        .bold()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    .fullScreenCover(isPresented: $showTipScreen) {
                        TipScreen(amount: $amountString,tipPercent: $tipPercent, showTipScreen: $showTipScreen, showTotalScreen: $showTotalScreen, showFirstScreenContents: $showFirstScreenContents)
                    }
                }
            }
            
            if showTotalScreen {
                TotalScreen(amount: $amount, tipPercent: $tipPercent, showTotalScreen: $showTotalScreen, showFirstScreen: $showFirstScreenContents)
            }
        }
    }
}

struct TipScreen: View {
    @Binding var amount: String
    @Binding var tipPercent: Double
    @Binding var showTipScreen: Bool
    @Binding var showTotalScreen: Bool
    @Binding var showFirstScreenContents: Bool
    
    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text("Add Tip")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Your Bill: $" + amount)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.bottom, 3.0)
                HStack {
                    Button(action: {
                        tipPercent = 0.15
                        showTipScreen = false
                        showFirstScreenContents = false
                        showTotalScreen = true
                    }) {
                        VStack {
                            Text("15%")
                                .font(.largeTitle)
                                .bold()
                            Text("Good")
                                .font(.caption)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )

                    Button(action: {
                        tipPercent = 0.18
                        showTipScreen = false
                        showFirstScreenContents = false
                        showTotalScreen = true
                    }) {
                        VStack {
                            Text("18%")
                                .font(.largeTitle)
                                .bold()
                            Text("Great")
                                .font(.caption)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }

                HStack {
                    Button(action: {
                        tipPercent = 0.20
                        showTipScreen = false
                        showFirstScreenContents = false
                        showTotalScreen = true
                    }) {
                        VStack {
                            Text("20%")
                                .font(.largeTitle)
                                .bold()
                            Text("Wow!")
                                .font(.caption)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )

                    Button(action: {
                        tipPercent = 0.25
                        showTipScreen = false
                        showFirstScreenContents = false
                        showTotalScreen = true
                    }) {
                        VStack {
                            Text("25%")
                                .font(.largeTitle)
                                .bold()
                            Text("Best Lashes Ever!")
                                .font(.caption)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 75)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }

                HStack {
                    Button(action: {}) {
                        Text("Custom Tip")
                            .bold()
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 60)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )

                    Button(action: {
                        tipPercent = 0.25
                        showTipScreen = false
                        showFirstScreenContents = false
                        showTotalScreen = true
                    }) {
                        Text("No Tip")
                            .bold()
                    }
                    .frame(minWidth: 0, maxWidth: 200, minHeight: 60)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 2)
                    )
                }
            }
            .padding()
            
            VStack {
                HStack {
                    Button(action: {
                        showTipScreen = false
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct TotalScreen: View {
    @Binding var amount: Double
    @Binding var tipPercent: Double
    @Binding var showTotalScreen: Bool
    @Binding var showFirstScreen: Bool

    var totalAmount: Double {
        return amount * (1 + tipPercent)
    }

    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Total Amount: $\(totalAmount, specifier: "%.2f")")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.white)

                Button(action: {
                    showTotalScreen = false
                    showFirstScreen = true
                }) {
                    Text("Back")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
