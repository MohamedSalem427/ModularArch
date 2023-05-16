//
//  WithLatestFrom.swift
//  Shift
//
//  Created by ziad on 4/14/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Combine

// MARK: - Operator methods
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher {
  
  func withLatestFrom<Other: Publisher, Result>(_ other: Other,
                                                resultSelector: @escaping (Output, Other.Output) -> Result)
      -> Publishers.WithLatestFrom<Self, Other, Result> {
    return .init(upstream: self, second: other, resultSelector: resultSelector)
  }

 
  func withLatestFrom<Other: Publisher>(_ other: Other)
      -> Publishers.WithLatestFrom<Self, Other, Other.Output> {
    return .init(upstream: self, second: other) { $1 }
  }
}

// MARK: - Publisher
extension Publishers {
  @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  public struct WithLatestFrom<Upstream: Publisher,
                               Other: Publisher,
                               Output>: Publisher where Upstream.Failure == Other.Failure {
    public typealias Failure = Upstream.Failure
    public typealias ResultSelector = (Upstream.Output, Other.Output) -> Output

    private let upstream: Upstream
    private let second: Other
    private let resultSelector: ResultSelector
    private var latestValue: Other.Output?

    init(upstream: Upstream,
         second: Other,
         resultSelector: @escaping ResultSelector) {
      self.upstream = upstream
      self.second = second
      self.resultSelector = resultSelector
    }

    public func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
      let sub = Subscription(upstream: upstream,
                             second: second,
                             resultSelector: resultSelector,
                             subscriber: subscriber)
      subscriber.receive(subscription: sub)
    }
  }
}

// MARK: - Subscription
@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publishers.WithLatestFrom {
  private class Subscription<S: Subscriber>: Combine.Subscription where S.Input == Output, S.Failure == Failure {
    private let subscriber: S
    private let resultSelector: ResultSelector
    private var latestValue: Other.Output?

    private let upstream: Upstream
    private let second: Other

    private var firstSubscription: Cancellable?
    private var secondSubscription: Cancellable?

    init(upstream: Upstream,
         second: Other,
         resultSelector: @escaping ResultSelector,
         subscriber: S) {
      self.upstream = upstream
      self.second = second
      self.subscriber = subscriber
      self.resultSelector = resultSelector
      trackLatestFromSecond()
    }

    func request(_ demand: Subscribers.Demand) {
      // withLatestFrom always takes one latest value from the second
      // observable, so demand doesn't really have a meaning here.
      firstSubscription = upstream
        .sink(
          receiveCompletion: { [subscriber] in subscriber.receive(completion: $0) },
          receiveValue: { [weak self] value in
            guard let self = self else { return }

            guard let latest = self.latestValue else { return }
            _ = self.subscriber.receive(self.resultSelector(value, latest))
        })
    }

    // Create an internal subscription to the `Other` publisher,
    // constantly tracking its latest value
    private func trackLatestFromSecond() {
      let subscriber = AnySubscriber<Other.Output, Other.Failure>(
        receiveSubscription: { [weak self] subscription in
          self?.secondSubscription = subscription
          subscription.request(.unlimited)
        },
        receiveValue: { [weak self] value in
          self?.latestValue = value
          return .unlimited
        },
        receiveCompletion: nil)

      self.second.subscribe(subscriber)
    }

    func cancel() {
      firstSubscription?.cancel()
      secondSubscription?.cancel()
    }
  }
}
