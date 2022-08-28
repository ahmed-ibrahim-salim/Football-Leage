//
//  DataHelper.swift
//  Football Leage
//
//  Created by Ahmad medo on 26/08/2022.
//

import Foundation

protocol DataHelper{
    associatedtype T
    
    func insert(item: T) throws -> Int
    func delete(item: T) throws -> T
    func findAll() -> [T]?
    
}

enum DataAccessError: Error {
//       case datastoreConnectionError
       case insertError
       case deleteError
       case searchError
//       case nilInData
}
