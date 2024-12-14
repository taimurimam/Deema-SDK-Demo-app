//
//  ContentView.swift
//  Deema SDK Demo app
//
//  Created by Taimur Imam on 14/12/24.
//

import SwiftUI
import DeemaSDK_Package

struct ContentView: View {
    
    @State  private var merchant_id = "1726"
    @State  private var amount = "100"
    @State  private var currency = "KWD"
    @State  private var SDK_Key = "sk_test_d5gntxxdoRNGkAweKjWZMr8iocXd3oNO1Wz5VJuW_65"
    var environment = Environment.sandbox
    
    @State private var isDeemaSdkOpen = false
    
    var body: some View {
        ZStack{
            VStack {
                if isDeemaSdkOpen{
                    DeemaSDK(SDK_Key: SDK_Key, amount: amount, merchant_id: merchant_id, currency: currency, environment: environment) { message, status in
                        isDeemaSdkOpen.toggle()// hide the dema sdk after complete the payment..
                        if status == .success{
                            // handle payment success
                        }else
                        if status == .failure{
                            // handle payment failure
                        }
                    }
                } else{
                    Button{
                        isDeemaSdkOpen.toggle()
                    }label: {
                        Text("Open Deema Sdk")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
