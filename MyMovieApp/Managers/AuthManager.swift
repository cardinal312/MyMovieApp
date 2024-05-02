//
//  AuthManager.swift
//  MyMovieApp
//
//  Created by Macbook on 2/5/24.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthManager {
    
    static let shared = AuthManager()
    private init() {}
    
    // A method to register the user
    // - Parameters:
    //    - userRequest: The user informashion (username, email, password)
    //    - compleation: A compleation with two values:
    //    - Bool: User was registered (saved) or not in data base correctly
    //    - Error: An optional errors with connection to data base
    
    func registerUser(with userRequest: RegisterUserRequest, compleation: @escaping (Bool, NetworkError?) -> Void) {
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                compleation(false, .registerUser)
                return
            }
            
            guard let resultUser = result?.user else {
                compleation(false, nil)
                return
            }
            
            let db = Firestore.firestore() // Referense to data base
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username" : username,
                    "email" : email
                ]) { error in
                    if let error = error {
                        compleation(false, .passUserDataToCollectionUser)
                        return
                    }
                    
                    compleation(true, nil) // If successfuly pass user data to db
                    
                    
                }
            
            
        }
    }
}
