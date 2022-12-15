//
//  CustomTableViewCell.swift
//  VIPER Ejemplo
//
//  Created by Gabriel Castillo Serafim on 15/12/22.
//

import UIKit
import SkeletonView

class CustomTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "CustomCellId"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        myImageView.isSkeletonable = true
        myLabel.isSkeletonable = true
        myLabel.linesCornerRadius = 8
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        //ContentView
        contentView.backgroundColor = .white
        
        //ImageView
        contentView.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageView.heightAnchor.constraint(equalToConstant: 50),
            myImageView.widthAnchor.constraint(equalToConstant: 50),
            myImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        //Label
        contentView.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 10),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    var myImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    var myLabel: UILabel = {
       
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        return label
    }()

}
