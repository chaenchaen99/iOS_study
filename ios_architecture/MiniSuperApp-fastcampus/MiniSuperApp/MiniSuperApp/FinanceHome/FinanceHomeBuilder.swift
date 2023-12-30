import ModernRIBs

protocol FinanceHomeDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

//FinanceHomeComponent가 SuperPayDashboardDependency를 충족시켜주어야함. 자식 RIB의 dependency
//FinanceHomeComponent는 금융관련기능의 첫 화면이므로 여기서 만들것임.
final class FinanceHomeComponent: Component<FinanceHomeDependency>, SuperPayDashboardDependency, CardOnFileDashboardDependency, AddPaymentMethodDependency {
  
    let cardsOnFileRepository: CardOnFileRepository
    var balence: ReadOnlyCurrentValuePublisher<Double> { balancePublisher }
    //잔액을 업데이트할 때 사용할 퍼블리셔
    private let balancePublisher: CurrentValuePublisher<Double>
    
    init(
        dependency: FinanceHomeDependency,
        balance: CurrentValuePublisher<Double>,
        cardOnFileRepository: CardOnFileRepository
    ){
        self.balancePublisher = balance
        self.cardsOnFileRepository = cardOnFileRepository
        super.init(dependency: dependency)
    }
}

protocol FinanceHomeBuildable: Buildable {
  func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting
}

final class FinanceHomeBuilder: Builder<FinanceHomeDependency>, FinanceHomeBuildable {
  
  override init(dependency: FinanceHomeDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: FinanceHomeListener) -> FinanceHomeRouting {
    let balancePublisher = CurrentValuePublisher<Double>(10000)
      
    let component = FinanceHomeComponent(dependency: dependency,
                                         balance: balancePublisher,
                                         cardOnFileRepository: CardOnFileRepositoryImpl()
    )
    let viewController = FinanceHomeViewController()
    let interactor = FinanceHomeInteractor(presenter: viewController)
    interactor.listener = listener
      
    let superPayDashboardBuilder = SuperPayDashboardBuilder(dependency: component)
    let cardOnFileDashboardBuilder = CardOnFileDashboardBuilder(dependency: component)
    let addPaymentMethodBuilder = AddPaymentMethodBuilder(dependency: component)
      
    return FinanceHomeRouter(
        interactor: interactor,
        viewController: viewController,
        superPayDashboardBuildable: superPayDashboardBuilder,
        cardOnFileDashboardBuildable: cardOnFileDashboardBuilder,
        addPaymentMethodBuildable: addPaymentMethodBuilder)
  }
}
