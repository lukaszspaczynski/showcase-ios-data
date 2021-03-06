//
//  ImageRequest.swift
//  ShowcaseData
//
//  Created by Lukasz Spaczynski on 01/12/2021.
//

#if canImport(UIKit)

import Foundation

struct ImageRequest: RestRequest {
    let url: URL

    init(url: URL) {
        self.url = url
    }
}

#endif
