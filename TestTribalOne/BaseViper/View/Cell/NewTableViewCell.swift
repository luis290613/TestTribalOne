//
//  NewTableViewCell.swift
//  TestTribalOne
//
//  Created by Diego on 19/04/24.
//

import UIKit
import Kingfisher

class NewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(urlImg: String, title: String) {
        titleLbl.text = title
        let url = URL(string: urlImg)
        let placeholderImage = UIImage(named: "placeholderone")
        iconImg.kf.indicatorType = .activity
        iconImg.kf.setImage(with: url, placeholder: placeholderImage)
    }
    
}
