//
//  MemoListView.swift
//  voiceMemo
//

import SwiftUI

struct MemoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var memoListViewModel: MemoListViewModel
    
  var body: some View {
      ZStack {
          VStack {
              if !memoListViewModel.memos.isEmpty {
                  CustomNavigationBar(
                    isDisplayLeftBtn: false,
                    rightBtnAction: {
                        memoListViewModel.navigationRightBtnTapped()
                    },
                    rightBtnType: memoListViewModel.navigationBarRightBtnMode
                  )
              }else {
                  Spacer()
                      .frame(height: 30)
              }
              // 타이틀 뷰
              TitleView()
              // 안내 뷰 혹은 메모리스트 컨텐츠 뷰
              
              // 메모작성 플로팅 아이콘 버튼 뷰
          }
      }
  }
}

//MARK: - 타이틀 뷰
private struct TitleView: View {
    @EnvironmentObject private var memoListViewModel: MemoListViewModel
    
    fileprivate var body: some View {
        HStack {
            if memoListViewModel.memos.isEmpty {
                Text("메모를\n추가해 보세요.")
            }else {
                Text("메모 \(memoListViewModel.memos.count)개가 \n 있습니다.")
            }
            Spacer()
        }
        .font(.system(size: 30, weight: .bold))
        .padding(.leading, 20)
    }
}

struct MemoListView_Previews: PreviewProvider {
  static var previews: some View {
    MemoListView()
          .environmentObject(PathModel())
          .environmentObject(MemoListViewModel())
  }
}
