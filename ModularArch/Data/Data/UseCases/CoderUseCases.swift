//
//  CoderUseCases.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation
import Combine

public protocol CoderUseCasesProtocol {
    func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError>
}
public struct CoderUseCases: CoderUseCasesProtocol {
    //MARK: - Attibutes
    let middleware: CodersMiddlewareProtocol
    //MARK: - Init
    public init(middleware: CodersMiddlewareProtocol = CodersMiddlewareService()) {
        self.middleware = middleware
    }
    // MARK: - Methods
    public func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError> {
        return middleware.getCodersList().flatMap { response -> AnyPublisher<[CoderItem], MiddlewareError> in
            Deferred {
                Future { promise in
                    promise(.success(response))
                }
            }.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
