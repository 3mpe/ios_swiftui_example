import Foundation


enum Env: String {
    case debug
    case release
}


struct VariableConfig {
    public static let DEBUG: Bool = true
    public static let VERSION: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    public static let APP_NAME = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as! String
    
}
