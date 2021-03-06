//
//  CircleProcessorTests.swift
//  ShowcaseDataTests
//
//  Created by Lukasz Spaczynski on 15/12/2021.
//

#if canImport(UIKit)

import CoreImage
import Nimble
import SnapshotTesting
import XCTest

@testable import ShowcaseData

final class CircleProcessorTests: XCTestCase {
    func testProcessImage() throws {
        // GIVEN
        var (sut, image, context) = Self.prepareTestComponents()

        // WHEN
        try sut.process(&image)
        let cgImage = context.createCGImage(image, from: image.extent)!
        let uiImage = UIImage(cgImage: cgImage)
        let imageView = UIImageView(image: uiImage)

        // THEN
        assertSnapshot(matching: imageView, as: .image)
    }
}

extension CircleProcessorTests {
    typealias TestComponents = (
        sut: CircleProcessor,
        referenceImage: CIImage,
        context: CIContext
    )

    static func prepareTestComponents() -> TestComponents {
        let context = CIContext()
        let imageUrl = Bundle.module.url(
            forResource: "reference-image", withExtension: "jpeg"
        )!
        let image = UIImage(
            data: try! Data(contentsOf: imageUrl))!
        let ciimage = CIImage(cgImage: image.cgImage!)
        let sut = CircleProcessor()

        return (sut, ciimage, context)
    }
}

#endif
