//
//  ContentView.swift
//  cv04_calculator
//
//  Created by David Krčmář on 14.03.2024.
//

import SwiftUI


struct ContentView: View {
    @State var number1: String = "0"
    @State var number2: String = "0"
    @State var operation: String = "+"
    @State var result: String = "0"
    
    private var viewModel: ContentViewModel = ContentViewModel()
    
    //vsechny view maji body
    var body: some View {
        //Vstack tvori neco jako tabulku seznam
        VStack {
          
//            HStack{
//                Text("Number: ")
//                //$ binding variable to number
//                TextField("0", text: $number1)
//            }
//            
//            HStack{
//                Text("Number: ")
//                TextField("0", text: $number2)
//            }
            
            
            LabelTextFieldRow(title: "Number", value: $number1)
            LabelTextFieldRow(title: "Number", value: $number2)
            LabelTextFieldRow(title: "Result:", value: $result)
            
            HStack{
                OperationBtn(symbol: "+", value: $operation)
                OperationBtn(symbol: "-", value: $operation)
            }
            //trailing closure u vsech objektu se to tak pouziva
            //kdyz nejsou argum. tak se nemusi psat ()
            Button("Calculate") {
                let num1 = (Float(self.number1)) ?? 0.0
                let num2 = (Float(self.number2)) ?? 0.0
                result = String(viewModel.calculate(number1: num1, number2: num2, operation: operation))
            }
            
        }
        .padding()
    }
}

//COMPONENTY
struct LabelTextFieldRow: View {
    var title: String
    @Binding var value: String
    
    var body: some View {
        HStack{
            Text(title)
            TextField("0", text: $value)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct OperationBtn: View {
    var symbol: String
    @Binding var value: String
    
    var body: some View {
        Button(symbol){
            value = symbol
        }
        .buttonStyle(.bordered)
    }
}

//makro pro vygenerovani contentview
#Preview {
    ContentView()
}
