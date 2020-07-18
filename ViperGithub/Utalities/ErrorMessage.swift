//
//  ErrorMessage.swift
//  iGitHub
//
//  Created by Eslam on 7/11/20.
//  Copyright © 2020 ioslam.co. All rights reserved.
//

import Foundation

enum GHError: String, Error {
    case invalidURL       = "Oops, CHECK URL🤨"
    case invalidUsername  = "Oops, CHECK YOUR THE USERNAME ❌"
    case unableToComplete = "Oops, CHECK YOUR INTERNET CONNECTION! ‼️"
    case invalidResponse  = "Oops, INVALID RESPONSE, PLEASE TRY AGAIN! ✖️"
    case invalidData      = "Oops, INVALID DATA RECEIVED FROM THE SERVER!⚠️ "
    case emptyUsername    = "PLEASE ENTER A USERNAME, WE NEED TO KNOW WHO TO LOOK FOR!⁉️."
}
