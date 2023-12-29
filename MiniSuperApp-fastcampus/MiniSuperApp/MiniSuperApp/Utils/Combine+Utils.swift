//
//  Combine+Utils.swift
//  MiniSuperApp
//  Subscribe들이 가장 최신값에 접근할 수 있게 해주되, 직접 값을 send 할 수는 없음.
//  Created by 정채연 on 2022/09/04.
//

import Combine
import CombineExt
import Foundation

public class ReadOnlyCurrentValuePublisher<Element>: Publisher {
    public typealias Failure = Never
    public typealias Output = Element
    
    public var value: Element {
        currentValueRelay.value
    }
    //접근제한자 : 같은 소스파일
    fileprivate let currentValueRelay: CurrentValueRelay<Output>
    
    fileprivate init(_ initialValue: Element){
        currentValueRelay = CurrentValueRelay(initialValue)
    }
    public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Element == S.Input {
        currentValueRelay.receive(subscriber: subscriber)
    }
}
//잔액을 관리하는 객체가 currentvaluepublisher를 생성해서 잔액이 바뀔때마다 send해줄것임.
//잔액을 사용하는 객체는 부모객체인 readonlycurrentvaluepublisher로 받아서 send할 수 없지만 value를 통해 원하는 값을 받을 것임.
public final class CurrentValuePublisher<Element>: ReadOnlyCurrentValuePublisher<Element> {
    typealias Output =  Element
    typealias Failure = Never
    
    public override init(_ initialValue: Element){
        super.init(initialValue)
    }
    
    public func send(_ value: Element){
        currentValueRelay.accept(value)
    }
}
