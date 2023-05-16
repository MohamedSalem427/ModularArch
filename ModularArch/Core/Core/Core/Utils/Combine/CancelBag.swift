//
//  CancelBag.swift
//  Shift
//
//  Created by ziad on 3/26/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Combine

public class CancellableBag {
    public var subscriptions = Set<AnyCancellable>()
    public init() {
        
    }
    public func cancel() {
        subscriptions.forEach {$0.cancel()}
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    
    public func store(in cancellableBag: CancellableBag) {
        cancellableBag.subscriptions.insert(self)
    }
}
