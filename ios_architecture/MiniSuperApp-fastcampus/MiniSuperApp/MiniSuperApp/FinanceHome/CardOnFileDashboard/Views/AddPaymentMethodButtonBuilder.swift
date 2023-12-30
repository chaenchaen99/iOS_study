//
//  AddPaymentMethodButtonBuilder.swift
//  MiniSuperApp
//
//  Created by 정채연 on 2022/09/12.
//

import ModernRIBs

protocol AddPaymentMethodButtonDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AddPaymentMethodButtonComponent: Component<AddPaymentMethodButtonDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AddPaymentMethodButtonBuildable: Buildable {
    func build(withListener listener: AddPaymentMethodButtonListener) -> AddPaymentMethodButtonRouting
}

final class AddPaymentMethodButtonBuilder: Builder<AddPaymentMethodButtonDependency>, AddPaymentMethodButtonBuildable {

    override init(dependency: AddPaymentMethodButtonDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AddPaymentMethodButtonListener) -> AddPaymentMethodButtonRouting {
        let component = AddPaymentMethodButtonComponent(dependency: dependency)
        let viewController = AddPaymentMethodButtonViewController()
        let interactor = AddPaymentMethodButtonInteractor(presenter: viewController)
        interactor.listener = listener
        return AddPaymentMethodButtonRouter(interactor: interactor, viewController: viewController)
    }
}
