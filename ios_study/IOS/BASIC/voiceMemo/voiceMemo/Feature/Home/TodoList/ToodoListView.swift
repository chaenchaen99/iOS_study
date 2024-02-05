//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var todolistViewModel: TodoListViewModel
    
  var body: some View {
      ZStack {
          //투두 셀 리스트
          VStack{
              if !todolistViewModel.todos.isEmpty {
                  CustomNavigationBar(
                    isDisplayLeftBtn: false,
                    rightBtnAction: {
                        todolistViewModel.navigationRightBtnTapped()
                    },
                    rightBtnType: todolistViewModel.navigationBarRightBtnMode
                  )
              } else {
                  Spacer()
                      .frame(height: 30)
              }
              TitleView()
          }
      }
  }
}
private struct TitleView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        HStack {
            if todoListViewModel.todos.isEmpty {
                Text("To do list를\n추가해보세요")
            }else{
                Text("To do list \(todoListViewModel.todos.count)개가\n있습니다.")
            }
            Spacer()
        }.font(.system(size: 30, weight: .bold))
            .padding(.leading, 20)
    }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
          .environmentObject(PathModel())
          .environmentObject(TodoListViewModel())
  }
}
