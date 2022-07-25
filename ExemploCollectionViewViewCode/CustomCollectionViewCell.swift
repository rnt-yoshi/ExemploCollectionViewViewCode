//
//  CustomCollectionViewCell.swift
//  ExemploCollectionViewViewCode
//
//  Created by Renato Yoshinari on 24/07/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
     }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(
            x: 5,
            y: contentView.frame.size.height - 50,
            width: contentView.frame.size.width - 10,
            height: 50
        )
        
        myImageView.frame = CGRect(
            x: 5,
            y: 0,
            width: contentView.frame.size.width - 10,
            height: contentView.frame.size.height - 50
        )
    }
    
    func configure(label: String, image: UIImage) {
        myLabel.text = label
        myImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
    }
}
