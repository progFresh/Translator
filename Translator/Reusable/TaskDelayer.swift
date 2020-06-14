//
//  TaskDelayer.swift
//  Translator
//
//  Created by Сергей Полозов on 14.06.2020.
//  Copyright © 2020 Сергей Полозов. All rights reserved.
//

import Foundation

final class TaskDelayer {

    var task: (() -> Void)?

    private let delay: TimeInterval
    private let operationQueue: OperationQueue

    init(delay: TimeInterval, task: (() -> Void)? = nil) {
        self.task = task
        self.delay = delay
        self.operationQueue = OperationQueue()
        self.operationQueue.maxConcurrentOperationCount = 1
    }

    func tryStart() {
        guard let task = self.task else { return }

        self.operationQueue.isSuspended = true
        self.operationQueue.cancelAllOperations()
        self.operationQueue.isSuspended = false
        let operation = DelayedOperation(delay: self.delay, block: task)
        self.operationQueue.addOperation(operation)
    }

    func cancel() {
        self.operationQueue.cancelAllOperations()
    }
}

