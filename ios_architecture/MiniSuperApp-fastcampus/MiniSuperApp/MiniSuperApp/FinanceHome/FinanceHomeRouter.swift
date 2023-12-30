import ModernRIBs

protocol FinanceHomeInteractable: Interactable, SuperPayDashboardListener, CardOnFileDashboardListener, AddPaymentMethodListener {
  var router: FinanceHomeRouting? { get set }
  var listener: FinanceHomeListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol FinanceHomeViewControllable: ViewControllable {
    func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
    
    private let superPayDashboardBuildable: SuperPayDashboardBuildable
    private var superPayRouting : Routing?
    
    private let cardOnFileDashboardBuildable: CardOnFileDashboardBuildable
    private var cardOnFileRouting: Routing?
    
    private let addPaymentMethodBuildable: AddPaymentMethodBuildable
    private var addPaymentMethodRouting: Routing?
    
   init(
    interactor: FinanceHomeInteractable,
    viewController: FinanceHomeViewControllable,
    superPayDashboardBuildable: SuperPayDashboardBuildable,
    cardOnFileDashboardBuildable: CardOnFileDashboardBuildable,
    addPaymentMethodBuildable: AddPaymentMethodBuildable
  ) {
      self.superPayDashboardBuildable = superPayDashboardBuildable
      self.cardOnFileDashboardBuildable = cardOnFileDashboardBuildable
      self.addPaymentMethodBuildable = addPaymentMethodBuildable
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
    
      func attachSuperPayDashboard(){
          if superPayRouting != nil {
              return
          }
          
          let router = superPayDashboardBuildable.build(withListener: interactor)
          
          let dashboard = router.viewControllable
          viewController.addDashboard(dashboard)
          
          self.superPayRouting = router
          attachChild(router)
      }
    func attachCardOnFileDashboard() {
        if cardOnFileRouting != nil {
            return
        }
        
        let router = cardOnFileDashboardBuildable.build(withListener: interactor)
        let dashboard = router.viewControllable
        viewController.addDashboard(dashboard)
        
        self.cardOnFileRouting = router
        attachChild(router)
    }
    
    func attachAddPaymentMethod() {
        //Ribs를 쓸 때 강제되는 것중에 하나는 viewController를 present했던 부모가 자식을 책임지고 닫아야한다는 것
        if addPaymentMethodRouting != nil {
            return
        }
        let router = addPaymentMethodBuildable.build(withListener: interactor)
        let navigation = NavigationControllerable(root: router.viewControllable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewControllable.present(navigation, animated: true, completion: nil)
        
        addPaymentMethodRouting = router
        attachChild(router)
    }
    
    func detachAddPaymentMehtod() {
        //레퍼런스로 들고있었던 라우터를 가져온다.
        guard let router = addPaymentMethodRouting else {
            return
        }
        viewControllable.dismiss(completion: nil)
        detachChild(router)
        addPaymentMethodRouting = nil
    }
}
