//
//  Project.swift
//  Portfolio
//
//  Created by Mathieu Dubart on 20/02/2025.
//

import Foundation

struct Project: Codable, Identifiable {
    var id: String
    var title: String
    var date: String
    var description: String
    var picturesUrl: [String]
    var videoUrl: String
    
    static let example = Project(id: "UEIOAIUE", title: "Example", date: "2024", description: "This is an example description", picturesUrl: ["https://s2.qwant.com/thumbr/474x314/c/6/28a9bf1046efb6ad60519ba6479b7cdc9ca34d404b3fcc799bf551e8120c24/th.jpg?u=https%3A%2F%2Ftse.mm.bing.net%2Fth%3Fid%3DOIP.9Izv-aszItToTtEqRMSE0QHaE6%26pid%3DApi&q=0&b=1&p=0&a=0"], videoUrl: "")
}
