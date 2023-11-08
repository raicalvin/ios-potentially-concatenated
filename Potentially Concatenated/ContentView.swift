//
//  ContentView.swift
//  Potentially Concatenated
//
//  Created by Simran Rai on 11/7/23.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var result: String = "Hello!"
    
    @State private var copyText: String = "Copy text"

    @State private var inputA: String = ""
    @State private var inputB: String = ""
    @State private var inputC: String = ""
    
    var body: some View {
        VStack {
            Text(result)
                .font(.headline)
                .padding(.top, 72)
            Button(copyText) {
                UIPasteboard.general.string = result
                copyText = "Copied!"
            }
            .font(.caption)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding(.top, 12)
            Spacer()
            VStack(spacing: 22) {
                TextFieldView(userInput: $inputA, label: "Input A")
                TextFieldView(userInput: $inputB, label: "Input B")
                TextFieldView(userInput: $inputC, label: "Input C")
            }
            .padding(.vertical, 24)
            CalculateButton(message: $inputA) {
                result = "\(inputA) \(inputB) \(inputC)"
                copyText = "Copy text"
            }
        }
    }
}

struct TextFieldView: View {
    @Binding var userInput: String
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter text", text: $userInput)
            Divider()
            Text(label)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 24)
    }
}

struct CalculateButton: View {
    @Binding var message: String
    var onClick: () -> Void
    var body: some View {
        Button {
            onClick()
        } label: {
            Text("Calculate")
                .frame(maxWidth: .infinity)
                .frame(height: 34)
                .foregroundColor(.blue)
        }
        .buttonStyle(.bordered)
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
    }
}

