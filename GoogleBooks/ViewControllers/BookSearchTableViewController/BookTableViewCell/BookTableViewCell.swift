//
//  BookTableViewCell.swift
//  GoogleBooks
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import UIKit
import AlamofireImage

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coverImageView.backgroundColor = UIColor.lightGray
    }

    func populate(from viewModel: BookCellViewModel) {
        titleLabel.text = viewModel.title
        authorsLabel.text = viewModel.authorsString
        
        if let url = URL(string: viewModel.coverURLString) {
            coverImageView.af_setImage(withURL: url)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
    }

}
