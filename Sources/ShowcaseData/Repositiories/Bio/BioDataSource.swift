//
//  BioDataSource.swift
//  ShowcaseData
//
//  Created by Lukasz Spaczynski on 22/11/2021.
//

#if canImport(UIKit)

import RxSwift

public protocol BioWebDataSource {
    func getBio() -> Observable<Result<Bio, Error>>
}

#endif
