//
//  AsynchronousRunner.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

public protocol AsynchronousRunner {
    func runOnConcurrent(_ action: @escaping () -> Void, _ qos: DispatchQoS.QoSClass)
    func runOnMain(_ action: @escaping () -> Void)
}
