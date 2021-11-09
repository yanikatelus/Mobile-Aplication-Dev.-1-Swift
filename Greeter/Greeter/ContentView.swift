//
//  ContentView.swift
//  Greeter
//
//  Created by Yanika Telus on 9/20/21.
//

import SwiftUI

struct ContentView: View {
    //button variable
    @State var counter: Int = 0
    @State var red: Bool = false
    @State var BoxOpacity: Bool = false
    @State var increment: String = ""
    
    //Inpur bar
    @State var name: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 60) {
            ButtonsView(counter: $counter, red: $red, BoxOpacity: $BoxOpacity, increment: $increment)//end of Hstack

            ZStack {
                HStack {
                    Text("Count:")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                    
                    Text("\(counter)")
                        .font(.title)
                        .padding()
                }//end of count hstack
                .padding()// end of Hstack
                .frame(width: 390.0)
                .background(red ? Color.red : Color.white)
                
                //place outside of the ZStack
                Text("\(increment) your count")
                    .font(.caption)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color.yellow)
                    .offset(x: 0, y: 40)
                    .opacity(BoxOpacity ? 1.0 : 0.0)
            }//end of zstack
            Spacer()
            
            HStack{
                Text("Name:")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("enter name", text: $name, onCommit: {
                    print("name was edited to \($name)")
                    showingAlert = true
                })
                    .padding()
                    .textContentType(.name)
                    .keyboardType(.alphabet)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }//end of name hstack
            .padding()
            .alert(isPresented: $showingAlert){Alert(title: Text("Greetings \(name)"), message: Text("How are you today?"), dismissButton: .default(Text("I'm Fine")))}
            Spacer()
        }//Main vstack end
    }//end of body
}// end of view

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonsView: View {
    @Binding var  counter: Int
    @Binding var red: Bool
    @Binding var BoxOpacity: Bool
    @Binding var increment: String
    
    var body: some View {
        HStack {
            Button{
                counter += 1
                if (counter >= 10 || counter <= -1){
                    red = true
                    BoxOpacity = true
                    if counter >= 10 {
                        increment = "Reduce"
                    }else{
                        increment = "Increase"
                    }
                }else{
                    red = false
                    BoxOpacity = false
                }
            }label: {
                Text("+")
                    .frame(width: 140.0, height: 140.0)
            }
            .font(.system(size: 40))
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(20)
            Button{
                counter -= 1
                if (counter <= -1 || counter >= 10){
                    red = true
                    BoxOpacity = true
                    if counter >= 0 {
                        increment = "Reduce"
                    }else{
                        increment = "Increase"
                    }
                }else{
                    red = false
                    BoxOpacity = false
                }
            }label: {
                Text("-")
                    .frame(width: 140.0, height: 140.0)
            }
            .font(.system(size: 40))
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}
