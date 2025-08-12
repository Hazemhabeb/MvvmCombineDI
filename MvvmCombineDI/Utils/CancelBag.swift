//
//  CancelBag.swift
//  MvvmCombineDI
//
//  Created by hazemhabeb on 12/08/2025.
//
import Combine

class CancelBag {
    var subscriptions = Set<AnyCancellable>()
    
    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}

