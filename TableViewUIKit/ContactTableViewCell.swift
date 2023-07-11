//
//  ContactTableViewCell.swift
//  TableViewUIKit
//
//  Created by swostik gautam on 08/07/2023.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    static let identifier = "contactTableCell"
    
    var contat: Contact = .init() {
        didSet{
            nameLabel.text = contat.name
            contactLabel.text = contat.contact
            countryLabel.text = contat.country
        }
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactLabel: UILabel = {
        let contactLabel = UILabel()
        contactLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        return contactLabel
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ContactTableViewCell.identifier)
        contentView.backgroundColor = .random
        addSubview(nameLabel)
        addSubview(contactLabel)
        addSubview(countryLabel)
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.image = UIImage(systemName: "person.circle")
        
        addSubview(image)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor , constant: 16),
            
            contactLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            contactLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),

            countryLabel.topAnchor.constraint(equalTo: contactLabel.topAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

