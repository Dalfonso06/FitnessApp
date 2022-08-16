//
//  DatabaseManager.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/31/22.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if the username and email is available
    /// - Parameters
    ///     - email: String that represents email
    ///     - username: String that represents username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Creates new user and adds it to the database
    /// - Parameters
    ///     - email: String that represents email
    ///     - username: String that represents username
    ///     - completion: callback for result of database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // success
                completion(true)
                return
            } else {
                // fail
                completion(false)
                return
            }
        }
    }
    
}
