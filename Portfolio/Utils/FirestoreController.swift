//
//  FirestoreController.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import Foundation
import FirebaseFirestore

class FirestoreController {
    let db = Firestore.firestore()
    
    func getProjects() async -> [Project] {
        do {
            let snapshot = try await db.collection("projects").getDocuments()
            let projects: [Project] = snapshot.documents.compactMap { document in
                let data = document.data()
                guard let title = data["title"] as? String,
                      let date = data["date"] as? String,
                      let description = data["description"] as? String,
                      let picturesUrl = data["picturesUrl"] as? [String],
                      let videoUrl = data["videoUrl"] as? String else {
                    return nil
                }
                
                return Project(
                    id: document.documentID,
                    title: title,
                    date: date,
                    description: description,
                    picturesUrl: picturesUrl,
                    videoUrl: videoUrl
                )
            }
            return projects
        } catch {
            print("Erreur Firestore : \(error)")
            return []
        }
    }
}

