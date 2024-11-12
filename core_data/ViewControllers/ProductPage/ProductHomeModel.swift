//
//  ProductHomeModel.swift
//  core_data
//
//  Created by artmac on 12/11/24.
//

import Foundation

// MARK: - Welcome
struct HomeModel: Codable {
    let data: DataClass?
    let status: String?
    let result: Bool?
    let message: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let topCat: [TopCat]?
    let banner: [Banner]?
    let recommended, flashSale, newProduct: [FlashSale]?

    enum CodingKeys: String, CodingKey {
        case topCat = "top_cat"
        case banner, recommended
        case flashSale = "flash_sale"
        case newProduct = "new_product"
    }
}

// MARK: - Banner
struct Banner: Codable {
    let photo: String?
}

// MARK: - FlashSale
struct FlashSale: Codable {
    let pID, pName, pBrandName, pCurrentPrice: String?
    let photo: String?
    let wishlistStatus: Bool?

    enum CodingKeys: String, CodingKey {
        case pID = "p_id"
        case pName = "p_name"
        case pBrandName = "p_brand_name"
        case pCurrentPrice = "p_current_price"
        case photo
        case wishlistStatus = "wishlist_status"
    }
}

// MARK: - TopCat
struct TopCat: Codable {
    let catID, catName: String?
    let photo: String?

    enum CodingKeys: String, CodingKey {
        case catID = "cat_id"
        case catName = "cat_name"
        case photo
    }
}
