import SwiftUI

struct NoteComponentContentView: View {
    let name: String
    let description: String
    let date: String
    let emoji: String
    @State private var isShowingPopup = false
    
    var truncatedName: String {
        if name.count > 20 {
            return String(name.prefix(20)) + "..."
        } else {
            return name
        }
    }
    
    var truncatedDescription: String {
        if description.count > 50 {
            return String(description.prefix(50)) + "..."
        } else {
            return description
        }
    }
    
    var body: some View {
        GroupBox {
            HStack {
                Text(emoji)
                    .font(.system(size: 55))
                VStack(alignment: .leading) {
                    HStack {
                        Text(truncatedName).font(.system(size: 16))
                        Spacer()
                        Text(date).foregroundColor(.gray)
                    }
                    Text(truncatedDescription).foregroundColor(.gray)
                        .font(.system(size: 14))
                }
            }
            .onTapGesture {
                isShowingPopup = true
            }
            .sheet(isPresented: $isShowingPopup, content: {
                PopupContentView(name: name, description: description)
            })
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
        .padding(.horizontal,16)
    }
}

struct PopupContentView: View {
    let name: String
    let description: String
    
    var body: some View {
        VStack {
            Text(name)
            Spacer().frame(height: 20)
            Text(description)
        }
        .background(Color.white)
    }
}

