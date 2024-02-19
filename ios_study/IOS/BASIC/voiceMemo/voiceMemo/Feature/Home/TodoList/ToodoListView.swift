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
                  .padding(.top, 20)
              if todolistViewModel.todos.isEmpty {
                  AnnouncementView()
              }else{
                  TodoListContentView()
                      .padding(.top, 20)
              }
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

private struct AnnouncementView: View {
    fileprivate var body: some View {
        VStack (spacing: 15){
            Spacer()
            Image("pencil")
                .renderingMode(.template)
            Text("\"매일 아침 5시 운동하자!\"")
            Text("\"내일 8시 수강신청하라고 알려줘\"")
            Text("\"1시 반 점심 약속 리마인드 해줘\"")
            
            Spacer()
        }
        .font(.system(size: 16))
        .foregroundColor(.customGray2)
    }
}

//MARK: - TodoList 컨텐츠 뷰
private struct TodoListContentView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        VStack{
            HStack{
                Text("할일 목록")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.leading, 20)
                
                Spacer()
            }
            ScrollView(.vertical){
                VStack(spacing: 0)
                {
                    Rectangle()
                        .fill(Color.customGray0)
                        .frame(height: 1)
                    
                    ForEach(todoListViewModel.todos, id: \.self) { todo in
                        //TODO: todo셀 뷰 todo 넣어서 뷰 호출
                        TodoCellView(todo: todo)
                    }
                }
            }
        }
    }
}
//MARK: todo 셀 뷰
private struct TodoCellView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    @State private var isRemoveSelected: Bool
    private var todo: Todo
    
    fileprivate init(
        isRemoveSelected: Bool = false,
        todo: Todo
    ){
        _isRemoveSelected = State(initialValue: isRemoveSelected)
        self.todo = todo
    }
    
    fileprivate var body: some View {
        VStack(spacing: 20) {
            HStack {
                if !todoListViewModel.isEditTodoMode {
                    Button(
                        action: { todoListViewModel.selectedBoxTapped(todo)},
                        label: {todo.selected ? Image("selectedBox"): Image("unSelectedBox")}
                    )
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text(todo.title)
                        .font(.system(size: 16))
                        .foregroundColor(todo.selected ? .customIconGray : .customBlack)
                    
                    Text(todo.convertedDayAndTime)
                        .font(.system(size: 16))
                        .foregroundStyle(.primary)
                }
                Spacer()
                
                if todoListViewModel.isEditTodoMode {
                    Button(
                        action: {
                            isRemoveSelected.toggle()
                            todoListViewModel.todoRemoveSelectedBoxTapped(todo)
                        },
                        label: {
                            isRemoveSelected ? Image("selectedBox") : Image("unSelectedBox")
                        }
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
          .environmentObject(PathModel())
          .environmentObject(TodoListViewModel())
  }
}
