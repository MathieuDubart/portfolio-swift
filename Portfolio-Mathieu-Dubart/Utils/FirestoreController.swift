//
//  FirestoreController.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class FirestoreController {
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    
    func getProjects() async -> [Project] {
        do {
            var parsedVideoUrl: String? = nil
            
            let snapshot = try await db.collection("projects").getDocuments()
            let projects: [Project] = snapshot.documents.compactMap { document in
                let data = document.data()
                guard let title = data["title"] as? String,
                      let date = data["date"] as? String,
                      let intro = data["intro"] as? String,
                      let picturesUrl = data["picturesUrl"] as? [String],
                      let description = data["description"] as? String else {
                    return nil
                }
                
                if let videoUrl = data["videoUrl"] as? String {
                    parsedVideoUrl = videoUrl
                }
                
                return Project(
                    id: document.documentID,
                    title: title,
                    date: date,
                    intro: intro,
                    description: description,
                    picturesUrl: picturesUrl,
                    videoUrl: parsedVideoUrl
                )
            }
            return projects
        } catch {
            print("Erreur Firestore : \(error)")
            return []
        }
    }
    
    func getDownloadURL(for path: String) async -> URL? {
        let imageRef = storage.child(path)
        
        return await withCheckedContinuation { continuation in
            imageRef.downloadURL { url, error in
                if let error = error {
                    print("Error while retrieving download URL for image: \(error.localizedDescription)")
                    continuation.resume(returning: nil)
                } else {
                    continuation.resume(returning: url)
                }
            }
        }
    }

}

