//
//  LabelTableViewCell.swift
//  TableViewUIKit
//
//  Created by swostik gautam on 11/07/2023.
//

import Foundation
import UIKit

class LabelTableViewCell: UITableViewCell {
    static let identifier: String = "cellIdentifier"
    
    var item: String = .init() {
        didSet{
            dateLabel.text = item
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: LabelTableViewCell.identifier)
        setUpViews()
    }
    
    func setUpViews(){
        
        imageAndText.addArrangedSubview(someRandomIcon)
        imageAndText.addArrangedSubview(dateLabel)
        itemView.addArrangedSubview(imageAndText)
        itemView.addArrangedSubview(author)
        
        cardView.addSubview(itemView)
        contentView.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            itemView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            itemView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            itemView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            itemView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            
            someRandomIcon.topAnchor.constraint(equalTo: itemView.topAnchor),
            someRandomIcon.leadingAnchor.constraint(equalTo: itemView.leadingAnchor),
            someRandomIcon.heightAnchor.constraint(equalToConstant: 40),
            someRandomIcon.widthAnchor.constraint(equalToConstant: 40),
            
            author.trailingAnchor.constraint(equalTo: itemView.trailingAnchor , constant: -16),
            author.bottomAnchor.constraint(equalTo: itemView.bottomAnchor , constant: -16),
            
        ])
    }
    lazy var cardView : UIView = {
        let cardView = UIView()
        cardView.layer.cornerRadius = 10.0
        cardView.backgroundColor = .random
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 10.0, height: 0.0)
        cardView.layer.shadowRadius = 6.0
        cardView.layer.shadowOpacity = 0.7
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var someRandomIcon : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.image = UIImage(systemName: "person.circle")
        return image
    }()
    
    lazy var imageAndText: UIStackView = {
        let itemView = UIStackView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.spacing = 10
        itemView.axis = .horizontal
        itemView.alignment = .top
        return itemView
    }()
    
    lazy var itemView: UIStackView = {
        let itemView = UIStackView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.spacing = 10
        imageView?.tintColor = .black
        itemView.axis = .vertical
        itemView.alignment = .trailing
        return itemView
    }()
    
    let author:UILabel = {
        let author =  UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font =  UIFont(name: "Avenir-Light", size: 15.0)
        author.text = "~ Aesop's Fables"
        return author
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    static var random: UIColor {
        let red = CGFloat.random(in: 0.6...1)
        let green = CGFloat.random(in: 0.6...1)
        let blue = CGFloat.random(in: 0.6...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
