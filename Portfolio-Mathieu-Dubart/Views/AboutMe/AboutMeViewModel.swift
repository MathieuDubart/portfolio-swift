//
//  AboutMeViewModel.swift
//  Portfolio-Mathieu-Dubart
//
//  Created by Mathieu Dubart on 22/02/2025.
//

import Foundation

class AboutMeViewModel: ObservableObject {
    var instagramUrl: String = "https://www.instagram.com/mathieudbrt/"
    var linkedinUrl: String = "https://www.linkedin.com/in/mathieu-dubart/"
    var githubUrl: String = "https://www.github.com/MathieuDubart"
    
    var role = "Bac+5 Student @ Gobelin\nFullstak Dev @ MyRole"
    var introduction = "I'm passionate about mobile apps, and Swift/SwiftUI. My long term goal is to learn as much as I can to be able to make intuitive, useful and visually impactful applications for culture and museums."
    
    init() {}
}
