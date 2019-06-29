import XCTest
@testable import EthereumKit

final class NetworkTests: XCTestCase {
    
    func testMainnet() {
        let network = ETHNetwork.mainnet
        XCTAssert(network.chainID == 1)
        XCTAssert(network.coinType == 60)
        XCTAssert(network.privateKeyPrefix == 0x0488ade4)
        XCTAssert(network.publicKeyPrefix == 0x0488b21e)
    }
    
    func testRopsten() {
        let network = ETHNetwork.ropsten
        XCTAssert(network.chainID == 3)
        XCTAssert(network.coinType == 1)
        XCTAssert(network.privateKeyPrefix == 0x04358394)
        XCTAssert(network.publicKeyPrefix == 0x043587cf)
    }
    
    func testKovan() {
        let network = ETHNetwork.kovan
        XCTAssert(network.chainID == 42)
        XCTAssert(network.coinType == 1)
        XCTAssert(network.privateKeyPrefix == 0x04358394)
        XCTAssert(network.publicKeyPrefix == 0x043587cf)
    }
    
    func testPrivateNetTestUse() {
        let network = ETHNetwork.private(chainID: 100, testUse: true)
        XCTAssert(network.chainID == 100)
        XCTAssert(network.coinType == 1)
        XCTAssert(network.privateKeyPrefix == 0x04358394)
        XCTAssert(network.publicKeyPrefix == 0x043587cf)
    }
    
    func testPrivateNet() {
        let network = ETHNetwork.private(chainID: 100, testUse: false)
        XCTAssert(network.chainID == 100)
        XCTAssert(network.coinType == 60)
        XCTAssert(network.privateKeyPrefix == 0x0488ade4)
        XCTAssert(network.publicKeyPrefix == 0x0488b21e)
    }
    
    func testNetworkInitializer() {
        let mainNetwork = ETHNetwork(name: "main")
        XCTAssertNotNil(mainNetwork)
        XCTAssertEqual(mainNetwork, ETHNetwork.mainnet)
        
        let ropstenNetwork = ETHNetwork(name: "ropsten")
        XCTAssertNotNil(ropstenNetwork)
        XCTAssertEqual(ropstenNetwork, ETHNetwork.ropsten)
        
        let kovanNetwork = ETHNetwork(name: "kovan")
        XCTAssertNotNil(kovanNetwork)
        XCTAssertEqual(kovanNetwork, ETHNetwork.kovan)
        
        let privateNetwork = ETHNetwork(name: "private", chainID: 1, testUse: false)
        XCTAssertNotNil(privateNetwork)
        XCTAssertEqual(privateNetwork, ETHNetwork.private(chainID: 1, testUse: false))
    }
}
