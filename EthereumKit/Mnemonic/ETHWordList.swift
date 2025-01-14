public enum ETHWordList {
    case english
    case japanese
    
    public var words: [String] {
        switch self {
        case .english:
            return englishWords
        case .japanese:
            return japaneseWords
        }
    }
}
