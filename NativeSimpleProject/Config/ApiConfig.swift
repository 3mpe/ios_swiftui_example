//
//  ApiConfig.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 19.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation


struct ApiConfig {
    private static let BaseURLDebug: String = "https://jsonplaceholder.typicode.com";
    private static let BaseURLRelease: String = "";
    public static var BaseURL: String = VariableConfig.DEBUG ? BaseURLDebug : BaseURLRelease;
}
