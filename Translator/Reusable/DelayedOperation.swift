//
//  DelayedOperation.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import Foundation

final class DelayedOperation: Operation {

    // MARK: - Constants

    private enum Constants {
        static let isExecuting = "isExecuting"
        static let isFinished = "isFinished"
    }

    // MARK: - Operation fields

    private var isExecute = false
    private var isFinish = false

    override var isAsynchronous: Bool {
        return true
    }

    override var isExecuting: Bool {
        get {
            return self.isExecute
        }
        set {
            self.willChangeValue(forKey: Constants.isExecuting)
            self.isExecute = newValue
            self.didChangeValue(forKey: Constants.isExecuting)
        }
    }

    override var isFinished: Bool {
        get {
            return self.isFinish
        }
        set {
            self.willChangeValue(forKey: Constants.isFinished)
            self.isFinish = newValue
            self.didChangeValue(forKey: Constants.isFinished)
        }
    }

    // MARK: - Private Methods

    private var delay: TimeInterval = 0
    private var block: EmptyBlock?
    private var queue = DispatchQueue.global(qos: .userInitiated)

    // MARK: - Lifecycle

    init(delay: TimeInterval, block: @escaping () -> Void) {
        self.delay = delay
        self.block = block
    }

    init(delay: TimeInterval, queue: DispatchQueue, block: @escaping () -> Void) {
        self.delay = delay
        self.queue = queue
        self.block = block
    }

    // MARK: - Operation

    override func start() {
        guard
            !isCancelled
        else {
            isFinished = true
            return
        }

        queue.asyncAfter(deadline: .now() + delay) {
            guard
                let block = self.block,
                !self.isCancelled
            else {
                self.isFinished = true
                return
            }

            self.isExecuting = true
            block()
            self.isFinished = true
        }
    }
}

