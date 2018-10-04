//
//  web3swift_EIP67_Tests.swift
//  web3swift-iOS_Tests
//
//  Created by Anton Grigoriev on 02.07.2018.
//  Copyright © 2018 Bankex Foundation. All rights reserved.
//

import XCTest
import CryptoSwift
import BigInt
import Result

@testable import web3swift_iOS

class web3swift_EIP67_Tests: XCTestCase {
    
    func testEIP67encoding() {
        var eip67Data = Web3.EIP67Code.init(address: EthereumAddress("0xe22b8979739D724343bd002F9f432F5990879901")!)
        eip67Data.gasLimit = BigUInt(21000)
        eip67Data.amount = BigUInt("1000000000000000000")
        //        eip67Data.data =
        let encoding = eip67Data.toString()
        print(encoding)
    }
    
    func testEIP67codeGeneration() {
        var eip67Data = Web3.EIP67Code.init(address: EthereumAddress("0xe22b8979739D724343bd002F9f432F5990879901")!)
        eip67Data.gasLimit = BigUInt(21000)
        eip67Data.amount = BigUInt("1000000000000000000")
        //        eip67Data.data =
        let encoding = eip67Data.toImage(scale: 5.0)
        XCTAssert(encoding != CIImage())
    }
    
    func testEIP67decoding() {
        var eip67Data = Web3.EIP67Code.init(address: EthereumAddress("0xe22b8979739D724343bd002F9f432F5990879901")!)
        eip67Data.gasLimit = BigUInt(21000)
        eip67Data.amount = BigUInt("1000000000000000000")
        //        eip67Data.data =
        let encoding = eip67Data.toString()
        guard let code = Web3.EIP67CodeParser.parse(encoding) else {return XCTFail()}
        XCTAssert(code.address == eip67Data.address)
        XCTAssert(code.gasLimit == eip67Data.gasLimit)
        XCTAssert(code.amount == eip67Data.amount)
    }
    
}
