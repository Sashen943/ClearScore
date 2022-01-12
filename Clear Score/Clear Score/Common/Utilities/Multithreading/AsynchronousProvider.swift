//
//  AsynchronousProvider.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import Foundation

public struct AsynchronousProvider {
    
    // MARK: Attribute(s)
    
    private static var asyncRunner: AsynchronousRunner = AsynchronousRunnerImplementation()
    
    // MARK: Method(s)
    
    public static func runOnConcurrent(_ action: @escaping () -> Void, _ qos: DispatchQoS.QoSClass) {
        asyncRunner.runOnConcurrent(action, qos)
    }
    
    public static func runOnMain(_ action: @escaping () -> Void) {
        asyncRunner.runOnMain(action)
    }
    
    public static func setAsyncRunner(_ asyncRunner: AsynchronousRunner) {
        self.asyncRunner = asyncRunner
    }
    
    public static func reset() {
        asyncRunner = AsynchronousRunnerImplementation()
    }
    
}
