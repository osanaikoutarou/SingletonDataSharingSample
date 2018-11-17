//
//  MyTableViewCell.swift
//  SingletonDataSharingSample
//
//  Created by 長内幸太郎 on 2018/11/17.
//  Copyright © 2018年 長内幸太郎. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    var didChangeLike:((_ like:Bool)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(myModel:MyModel) {
        titleLabel.text = myModel.title
        likeButton.isSelected = myModel.like
    }
    
    @IBAction func tappedLike(_ sender: Any) {
        likeButton.isSelected.toggle()
        
        if let didChangeLike = didChangeLike {
            didChangeLike(likeButton.isSelected)
        }
    }
}
