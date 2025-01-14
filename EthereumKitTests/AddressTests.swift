import XCTest
@testable import EthereumKit

class AddressTests: XCTestCase {
    func testAddressInitialization() {
        let string = "0x88b44BC83add758A3642130619D61682282850Df"
        let hex = "88b44bc83add758a3642130619d61682282850df"
        XCTAssert(ETHAddress(data: Data(hex: hex)).string == string)
        XCTAssert(ETHAddress(string: string).data.toHexString() == hex)
    }
    
    func testAddressGeneration() {
        let entropy = Data(hex: "000102030405060708090a0b0c0d0e0f")
        let mnemonic = ETHMnemonic.create(entropy: entropy)
        let seed = try! ETHMnemonic.createSeed(mnemonic: mnemonic)
        let wallet = ETHHDWallet(seed: seed, network: .mainnet)
        
        let firstAddress = try! wallet.address(at: 0)
        XCTAssertEqual(firstAddress, "0x83f1caAdaBeEC2945b73087F803d404F054Cc2B7")
        
        let secondAddress = try! wallet.address(at: 1)
        XCTAssertEqual(secondAddress, "0xb3c3D923CFc4d551b38Db8A86BbA42B623D063cE")
        
        let thirdAddress = try! wallet.address(at: 2)
        XCTAssertEqual(thirdAddress, "0x82e35B34CfBEB9704E51Eb17f8263d919786E66a")
        
        let forthAddress = try! wallet.address(at: 3)
        XCTAssertEqual(forthAddress, "0xCF1D652DAb65ea4f10990FD2D2E59Cd7cbEb315a")
    }
}
