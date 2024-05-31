//
//  PhoneElementContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct PhoneElementContentView: View {
    let title: String
    let opened: String
    let phone: String
    
    var body: some View {
        Button(action: {copyPhoneNumber(phone: self.phone)}, label: {
                HStack{
                    VStack(alignment: .leading){
                        Text("\(title)")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("\(opened)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("\(phone)")
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }).padding(6)
            
    }
}

func copyPhoneNumber(phone: String) {
    UIPasteboard.general.string = phone
    showAlert(message: "Phone number \(phone) copied to clipboard")
}

func showAlert(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
}


#Preview {
    PhoneElementContentView(title: "Help line",opened: "Nonstop",phone: "123456789")
}
