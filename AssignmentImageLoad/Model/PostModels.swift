//
//  PostModels.swift
//  AssignmentImageLoad
//
//  Created by admin on 14/04/24.
//

import Foundation

// MARK: - PostModel
struct PostModel: Codable {
    let id, title, language: String?
    let thumbnail: Thumbnail?
    let mediaType: Int?
    let coverageURL: String?
    let publishedAt, publishedBy: String?
    let backupDetails: BackupDetails?
    
    enum CodingKeys: String, CodingKey {
        case id, title, language
        case thumbnail
        case mediaType
        case coverageURL
        case publishedAt, publishedBy
        case backupDetails
    }
}

    // MARK: - BackupDetails
struct BackupDetails: Codable {
    let pdfLink: String?
    let screenshotURL: String?
    
    enum CodingKeys: String, CodingKey {
        case pdfLink, screenshotURL
    }
}

    // MARK: - Thumbnail
struct Thumbnail: Codable {
    let id: String?
    let version: Int?
    let domain: String?
    let basePath, key: String?
    let qualities: [Int]?
    let aspectRatio: Double?
    
    enum CodingKeys: String, CodingKey {
        case id ,version ,domain ,basePath ,key ,qualities ,aspectRatio
    }
}


/*
 {
 "id": "coverage-64b130",
 "title": "From IIM to Monkhood: How an IIT-IIM alumnus found spiritual fulfillment",
 "language": "english",
 "thumbnail": {
 "id": "img-3f66bfcc-4a56-41f7-b24f-23e4d5402e43",
 "version": 1,
 "domain": "https://cimg.acharyaprashant.org",
 "basePath": "images/img-3f66bfcc-4a56-41f7-b24f-23e4d5402e43",
 "key": "image.jpg",
 "qualities": [10, 20, 30, 40],
 "aspectRatio": 1
 },
 "mediaType": 0,
 "coverageURL": "https://www.indiatoday.in/education-today/news/story/from-iim-to-monkhood-how-an-iit-iim-alumnus-found-spiritual-fulfillment-acharya-prashant-2508011-2024-02-28",
 "publishedAt": "2024-02-28",
 "publishedBy": "India Today",
 "backupDetails": {
 "pdfLink": "https://paf-web.s3.ap-south-1.amazonaws.com/media/india-today-28-feb-2024.pdf",
 "screenshotURL": "https://cimg.acharyaprashant.org/images/img-18cde857-119c-4b49-bc8a-a5b67226498f/40/image.jpg"
 }
 }
 */
