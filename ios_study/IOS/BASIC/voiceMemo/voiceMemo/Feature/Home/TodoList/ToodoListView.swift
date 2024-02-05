//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private pathModel: PathModel
    
  var body: some View {
    Text("Todo List")
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
