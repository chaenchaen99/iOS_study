## KTV Application Structure

AppDelegate
- App 프로세스의 Life cycle 관리
- Scene Session의 생성/삭제 Life cycle 관리

SceneDelegate
- UI Scene의 Life cycle 관리


ViewController
- View 생성 및 UI Configuration
- View 의 이벤트 처리
- View와 Model을 연결(ViewModel 의 bind)


UIViewController - LifeCycle

init
- 인스턴스 생성됨
- 아직 뷰가 없는 상태이므로 뷰를 호출하지 않는다.
loadView
- 뷰가 생성됨
viewDidLoad
- 뷰가 로드되었음
- 일반적인 뷰 구성은 이때 호출한다.
viewWillAppear
viewDidAppear
viewWillDisappear
viewDidDisappear
- 뷰를 닫히고 난 뒤, 뷰가 가려진 뒤
deinit

UIViewController - Child View ViewController
- 뷰 컨트롤러는 자식 뷰 컨트롤러를 가질 수 있다.
- 자식 뷰 컨트롤러는 부모의 생명 주기를 따른다.

View
- 화면을 구성하는데 기본이 되는 Class
- NSObject를 상속한 UIResponder를 상속해서 만들어져있음
- UIKit에서 제공하는 기본적인 View
  (UILabel, UIScrollView, UIImageView, UITableView, UICollectionVIew ,,,)

frame과 bounds로 뷰의 위치 표현
- 뷰의 좌표계: x,y, width, height
frame: super view로부터의 상대적인 위치
bounds: frame을 기준으로 view를 렌더링할 위치(ex: scrollView의 스크롤 위치)
일반적으로는 bounds의 x,y 좌표는 0

디테일한 처리는 Layer에서 담당
- view는 n개의 layer를 가질 수 있고, Layer를 통해서 곡면 표현 혹은, 외곽선 등의 디테일한 뷰의 처리를 해줄 수 있다.
view.layer.conerRadius
view.layer.borderWidth
view.layer.borderColor

Layout 및 Subview 관리
- n개의 subview를 추가, 제거 가능
그 subview를 layout할 수 있음
view의 크기 혹은 bounds가 변경이 될 때 layoutSubviews 메소드가 불리게 되고, 
이를 override하여 화면 변화에 따른 layout을 재조정할 수 있음.
이러한 layout 재조정을 AutoLayout을 통해 자동화할 수 있음

주의사항
- view의 접근은 반드시 main thread에서 이뤄져야 하며
다른 thread에서 접근시 의도하지 않는대로 동작하지 않을 수 있음.

