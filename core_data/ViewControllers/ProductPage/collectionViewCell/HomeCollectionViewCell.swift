//
//  HomeCollectionViewCell.swift
//  core_data
//
//  Created by artmac on 12/11/24.
//

import UIKit
import SDWebImage
class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var prioductName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(with data: FlashSale){
        if let image = data.photo, let name = data.pName, let brand = data.pBrandName, let price = data.pCurrentPrice{
            if let url = URL(string: image) {
                DispatchQueue.main.async {
                    
                    self.productImage.sd_setImage(with: url)
                }
            }
            self.prioductName.text = name
            self.brand.text = brand
            self.price.text = price
        }
    }

}
