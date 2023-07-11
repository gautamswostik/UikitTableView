//
//  DateTableViewCell.swift
//  TableViewUIKit
//
//  Created by swostik gautam on 11/07/2023.
//

import Foundation
import UIKit

class DateTableViewCell: UITableViewCell {
    static var dateIdentifier: String = "DateIDentifier"
    
    var date: String = .init(){
        didSet {
            label.text = date
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DateTableViewCell.dateIdentifier)
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor  , constant: 16),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 16),
        ])
    }
    
    let label : UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 28)
        return label
    } ()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
