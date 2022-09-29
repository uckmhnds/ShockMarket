//
//  SingleProductCollectionViewCell.swift
//  ShockMarket
//
//  Created by Abdurrahman Gazi Yavuz on 29.09.2022.
//

import UIKit
import SDWebImage

class SingleProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SingleProductCollectionViewCell"
    
    private let productImageView: UIImageView = {
        
        let imageView                   = UIImageView()
        imageView.contentMode           = .scaleAspectFill
        imageView.backgroundColor       = .systemRed
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(productImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImageView.frame = contentView.bounds
    }
    
    
    // Third Party
    
    public func configure(with address: String){
        
        guard let url = URL(string: "\(address)") else {return}
        
        productImageView.sd_setImage(with: url, completed: nil)
    }

    
}
