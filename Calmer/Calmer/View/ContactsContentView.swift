//
//  ContactsContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct ContactsContentView: View {
    var body: some View {
        VStack{
            
            Text("Contacts")
                .font(.title)
            
            Form{
                PhoneElementContentView(title: "Depression Line",opened: "Nonstop",phone: "731197475")
                PhoneElementContentView(title: "Calm Minds Support",opened: "Po-Pa 12-22 hod.",phone: "123456789")
                PhoneElementContentView(title: "Hope Helpline",opened: "Po-Pa 8-16 hod.",phone: "123456789")
                
            }
        }
    }
}


#Preview {
    ContactsContentView()
}
