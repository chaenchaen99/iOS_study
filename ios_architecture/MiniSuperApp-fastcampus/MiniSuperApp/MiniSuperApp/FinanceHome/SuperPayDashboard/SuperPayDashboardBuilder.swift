//
//  SuperPayDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/08/21.
//

import ModernRIBs
import Foundation

protocol SuperPayDashboardDependency: Dependency {
    var balence: ReadOnlyCurrentValuePublisher<Double> { get }
}
//superpaydashboard는 복잡한 로직보다 UI를 그리는 로직이 더 많기 때문에 builder에서 balence를 생성하기보다는 부모로부터 받는 것이 더 좋아보임.
final class SuperPayDashboardComponent: Component<SuperPayDashboardDependency>, SuperPayDashboardInteractorDependency {
    
    var balenceFormatter: NumberFormatter { Formatter.balanceFormatter}
    var balence: ReadOnlyCurrentValuePublisher<Double>{ dependency.balence }
}

// MARK: - Builder

protocol SuperPayDashboardBuildable: Buildable {
    func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting
}

final class SuperPayDashboardBuilder: Builder<SuperPayDashboardDependency>, SuperPayDashboardBuildable {

    override init(dependency: SuperPayDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting {
        let component = SuperPayDashboardComponent(dependency: dependency)
        let viewController = SuperPayDashboardViewController()
        let interactor = SuperPayDashboardInteractor(presenter: viewController,
        dependency: component)
        interactor.listener = listener
        return SuperPayDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
