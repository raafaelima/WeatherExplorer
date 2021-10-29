//
//  LocalCacheManagerTest.swift
//  CountryExplorerTests
//
//  Created by Rafael Lima on 28/10/2021.
//

import XCTest

@testable import CountryExplorer

class LocalCacheManagerTest: XCTestCase {

    private var sut: CacheManager!

    override func setUp() {
        super.setUp()
        sut = LocalCacheManager()
    }

    func testSaveAndRetrieveInformationFromFile() throws {
        let myText = "Some text to write to file"
        let data = Data(myText.utf8)

        sut.save(onCache: data)

        let cache = String(decoding: sut.load(), as: UTF8.self)
        XCTAssertTrue(cache.contains("Some text"))
    }
}
