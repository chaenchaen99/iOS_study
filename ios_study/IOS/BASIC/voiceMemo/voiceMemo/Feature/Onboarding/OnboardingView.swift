//
//  OnboardingView.swift
//  voiceMemo
//

//swiftUI는 뷰가 계산하기 어렵거나 많이 복잡해지면 아예 빌드되지 않는 문제가 있기에 하위 뷰를 많이 나눌 수록 좋다.
import SwiftUI

struct OnboardingView: View {
    @StateObject private var pathModel = PathModel()
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var todoListViewModel = TodoListViewModel()
    @StateObject private var memoListViewModel = MemoListViewModel()
    
  var body: some View {
    //TODO: 화면전환 구현 필요
      NavigationStack(path: $pathModel.paths){
//          OnboardingContentView(onboardingViewModel: onboardingViewModel)
          MemoListView()
              .environmentObject(memoListViewModel)
              .navigationDestination(for: PathType.self, destination: { pathType in
                  switch pathType {
                  case .homeView:
                      HomeView()
                          .navigationBarBackButtonHidden()
                  case .todoView:
                      TodoView()
                          .navigationBarBackButtonHidden()
                      
                  case .memoView:
                      MemoView()
                          .navigationBarBackButtonHidden()
                          .environmentObject(memoListViewModel)
                  }
              })
      }.environmentObject(pathModel)
  }
}

// MARK: 온보딩 컨텐츠 뷰
private struct OnboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack {
            //온보딩 셀 리스트 뷰
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            
            Spacer()
            
            //시작 버튼 뷰
            StartBtnView()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//MARK: 온보딩 셀 리스트 뷰
private struct OnboardingCellListView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int
    
    fileprivate init(onboardingViewModel: OnboardingViewModel, selectedIndex: Int = 0) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    fileprivate var body: some View {
        TabView(selection: $selectedIndex){
            //온보딩 셀
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                OnboardingCellView(OnboardingContent: onboardingContent)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
        .background(
            selectedIndex % 2 == 0
            ? Color.customSky
            : Color.customBackgroundGreen
        ).clipped()
    }
}

//MARK: 온보딩 셀 뷰
private struct OnboardingCellView: View {
    private var OnboardingContent: OnboardingContent
    
    fileprivate init(OnboardingContent: OnboardingContent) {
        self.OnboardingContent = OnboardingContent
    }
    
    fileprivate var body: some View {
        VStack{
            Image(OnboardingContent.imageFileName)
                .resizable()
                .scaledToFit()
            
            HStack{
                Spacer()
                
                VStack {
                    Spacer()
                        .frame(height: 46)
                    
                    Text(OnboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(OnboardingContent.subTitle)
                        .font(.system(size: 16))
                }
                
                Spacer()
            }
            .background(Color.customWhite)
            .cornerRadius(0)
        }
        .shadow(radius: 10)
    }
}

//MARK: 시작하기 버튼 뷰
private struct StartBtnView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    fileprivate var body: some View{
        Button(
            action: {
                pathModel.paths.append(.memoView)
            }, label: {
                HStack {
                    Text("시작하기")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.customBackgroundGreen)
                    
                    Image("startHome")
                        .renderingMode(.template)
                        .foregroundColor(.customBackgroundGreen)
                }
            }).padding(.bottom, 50)
        }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
