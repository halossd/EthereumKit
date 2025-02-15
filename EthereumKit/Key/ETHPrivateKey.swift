/// Represents a private key
public struct ETHPrivateKey {
    
    // Private key in data format
    public let raw: Data
    
    public init(raw: Data) {
        self.raw = raw
    }
    
    /// Publish key derived from private key
    public var publicKey: ETHPublicKey {
        return ETHPublicKey(privateKey: self)
    }
    
    /// Sign signs provided hash data with private key by Elliptic Curve, Secp256k1
    ///
    /// - Parameter hash: hash in data format
    /// - Returns: signiture in data format
    /// - Throws: .cryptoError(.failedToSign) when failed to sign
    public func sign(hash: Data) throws -> Data {
        return try ETHCrypto.sign(hash, privateKey: raw)
    }
}
