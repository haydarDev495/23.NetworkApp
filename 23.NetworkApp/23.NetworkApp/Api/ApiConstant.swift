//
//  ApiConstant.swift
//  23.NetworkApp
//
//  Created by Haydar Bekmuradov on 12.09.22.
//

import Foundation

class ApiConstant {
    // local server
    static let serverPath = "http://localhost:3000/"
    
    // posts
    static let postPath = serverPath + "posts"
    static let postPathUrl = URL(string: postPath)
    
    // comments
    static let commentPath = serverPath + "comments"
    static let commentPathUrl = URL(string: commentPath)
    
}
