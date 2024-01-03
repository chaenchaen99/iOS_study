//
//  ContentView.swift
//  WarmUp
//
//  Created by 정채연 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0
    @State private var dates: Set<DateComponents> = []
    
    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    struct FileItem: Hashable, Identifiable, CustomStringConvertible {
        var id: Self { self }
        var name: String
        var children: [FileItem]? = nil
        var description: String {
            switch children {
            case nil:
                return "📄 \(name)"
            case .some(let children):
                return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
            }
        }
    }

    let data =
      FileItem(name: "users", children:
        [FileItem(name: "user1234", children:
          [FileItem(name: "Photos", children:
            [FileItem(name: "photo001.jpg"),
             FileItem(name: "photo002.jpg")]),
           FileItem(name: "Movies", children:
             [FileItem(name: "movie001.mp4")]),
              FileItem(name: "Documents", children: [])
          ]),
         FileItem(name: "newuser", children:
           [FileItem(name: "Documents", children: [])
           ])
        ])
    
    var body: some View {
        VStack {
            
            Image(systemName: "carrot")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CARROT")
                .brightness(0.4)
                .badge(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .scaleEffect(2.0)
        }
        .padding()
        
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
            Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
            DisclosureGroup("Sub-items") {
                Text("Sub-item 1")
            }
        }
        
        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { fruits.remove(atOffsets: $0) }
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("Fruits")
            .toolbar {
                EditButton()
            }
        }
        Gauge(value: current, in: minValue...maxValue) {
                    Text("BPM")
                } currentValueLabel: {
                    Text("\(Int(current))")
                } minimumValueLabel: {
                    Text("\(Int(minValue))")
                } maximumValueLabel: {
                    Text("\(Int(maxValue))")
                }
//        MultiDatePicker("Dates Available", selection: $dates)
        OutlineGroup(data, children: \.children) { item in
            Text("\(item.description)")
        }
        
    }
}

#Preview {
    ContentView()
}
