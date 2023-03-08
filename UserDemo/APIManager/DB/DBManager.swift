//
//  DBManager.swift
//  UserDemo
//
//  Created by Shrawan Kumar sharma on 07/03/23.
//

import Foundation
import SQLite3

// MARK: - DBManager
final class DBManager{
    private let dbPath: String = "demoDB.sqlite"
    private var databasePointer:OpaquePointer?
    
    init(){
        databasePointer = openDatabase()
        createTable()
        insert(name: "Username", password: "Password")
    }
}

// MARK: - DBManager Configuration
extension DBManager{
    func openDatabase() -> OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            debugPrint("can't open demoDB database")
            return nil
        }
        else{
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS user(user TEXT,password TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(databasePointer, createTableString, -1, &createTableStatement, nil) == SQLITE_OK{
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
            } else {
                print("Table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
}

// MARK: - DBManager CRUD
extension DBManager{
    final func insert(name:String, password:String){
        let persons = read()
        if persons?.username == name {
            return
        }
        let insertStatementString = "INSERT INTO user (user, password) VALUES (?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(databasePointer, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (password as NSString).utf8String, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    final func read() -> LoginRequestModel? {
        let queryStatementString = "SELECT * FROM user;"
        var loginUD : LoginRequestModel?

        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(databasePointer, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                loginUD = LoginRequestModel(username: name, password: password)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return loginUD ?? nil
    }
}



