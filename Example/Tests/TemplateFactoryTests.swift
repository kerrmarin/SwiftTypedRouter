//
//  TemplateFactoryTests.swift
//  SwiftTypedRouter_Tests
//
//  Created by Sam Dean on 05/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import XCTest

@testable import SwiftTypedRouter

final class TemplateFactoryTests: XCTestCase {

    var factory: TemplateFactory.FX!

    override func setUp() {
        super.setUp()

        self.factory = TemplateFactory.start()
    }

    override func tearDown() {
        self.factory = nil

        super.tearDown()
    }

    func testTemplateFactory_createSimplePath() {
        let template = factory.path("root").template()

        XCTAssertEqual(template.template, "root")
    }

    func testTemplateFactory_complexPath() {
        let template = factory.path("complex", "path").template()

        XCTAssertEqual(template.template, "complex/path")
    }

    func testTemplateFactory_singlePlaceholder() {
        let template = factory.path("root").placeholder("id", String.self).template()

        XCTAssertEqual(template.template, "root/:id")
    }

    func testTemplateFactory_onlyPlaceholder() {
        let template = factory.placeholder("id", String.self).template()

        XCTAssertEqual(template.template, ":id")
    }

    func testTemplateFactory_multiplePlaceholders() {
        let template2 = factory.path("1").placeholder("p1", String.self)
            .path("2").placeholder("p2", Int.self)
            .template()
        XCTAssertEqual(template2.template, "1/:p1/2/:p2")

        let template3 = factory.path("1").placeholder("p1", String.self)
            .path("2").placeholder("p2", Int.self)
            .path("3").placeholder("p3", Bool.self)
            .template()
        XCTAssertEqual(template3.template, "1/:p1/2/:p2/3/:p3")
    }
}