import ModernRIBs

protocol FinanceHomeRouting: ViewableRouting {
    func attachSuperPayDashboard()
    func attachCardOnFileDashboard()
    func attachAddPaymentMethod()
    func detachAddPaymentMehtod()
}

protocol FinanceHomePresentable: Presentable {
  var listener: FinanceHomePresentableListener? { get set }
  // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FinanceHomeListener: AnyObject {
  // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FinanceHomeInteractor: PresentableInteractor<FinanceHomePresentable>, FinanceHomeInteractable, FinanceHomePresentableListener,
                                   AdaptivePresentationControllerDelegate{
    
  
  weak var router: FinanceHomeRouting?
  weak var listener: FinanceHomeListener?
    
    let presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy
  
  // TODO: Add additional dependencies to constructor. Do not perform any logic
  // in constructor.
  override init(presenter: FinanceHomePresentable) {
      self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
      super.init(presenter: presenter)
      presenter.listener = self
      self.presentationDelegateProxy.delegate = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    
      router?.attachSuperPayDashboard()
      router?.attachCardOnFileDashboard()
  }
  
  override func willResignActive() {
    super.willResignActive()
    // TODO: Pause any business logic.
  }
    func presentationControllerDidDismiss() {
        router?.detachAddPaymentMehtod()
    }
    
    //MARK: - cardOnFileDashboardListener
    func cardOnFileDashboardDidTapAddPaymentMethod() {
        //이 interactor는 router에게 AddPaymentMethod를 붙여줘 라고 전달.
        router?.attachAddPaymentMethod()
        //이제 AddPaymentMethod를 붙이기 위해서 Builder를 생성해 주어야 함.
    }
    //MARK: - AddPaymentMethodListener
    func addPaymentMethodDidTapClose() {
        router?.detachAddPaymentMehtod()
    }
    
    func addPaymentMethodDidAddCard(paymentMethod: PaymentMethod) {
        router?.detachAddPaymentMehtod()
    }
}
