//
//  Project.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import Foundation

struct Project: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var date: String
    var intro: String
    var description: String
    var picturesUrl: [String]
    var videoUrl: String?
    
    var downloadedPicturesUrl: [URL?] = []
    var downloadedVideoUrl: URL? = nil
    
    static let example = Project(id: "UEIOAIUE", title: "Owl", date: "2022", intro: "Owl is reversing radar for electric wheelchairs, built during my bachelor's second year @ Gobelins", description: "Owl is a reversing radar. It's a school project revolving around disability, specifically cerebro-injuries.We had to build an object or a game to help people with disabilities to socialize or to make their everyday life easier. After a few interviews with people from an association, we noticed that for those in electric wheelchairs, it was often difficult to make half-turns or to go backward without running into an obstacle, mainly because they couldn't turn their heads.", picturesUrl: [
        "gs://portfolio-cb9d5.firebasestorage.app/pictures/owl/owl-final-product.jpg"], videoUrl: "")
}
