//
//  MemoViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit

class MemoViewCell: UICollectionViewCell {
    public var background:UIButton = UIButton()
    public var titleLabel:UILabel = UILabel()
    public var editDateLabel:UILabel = UILabel()
    public var infoLabel:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        background.addSubview(titleLabel)
        background.addSubview(editDateLabel)
        background.addSubview(infoLabel)
        self.contentView.addSubview(background)
        
        background.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        titleLabel.numberOfLines = 2
        titleLabel.text = "!!"
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(4)
            make.leading.equalTo(4)
            make.trailing.equalTo(4)
            make.height.lessThanOrEqualTo(40)
        }
        
        editDateLabel.text = "2012-02-01"
        editDateLabel.textColor = .gray
        editDateLabel.snp.makeConstraints{make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.trailing.equalTo(4)
            make.leading.equalTo(4)
            make.height.lessThanOrEqualTo(20)
        }
        
        infoLabel.numberOfLines = 2
        infoLabel.text = "1112\n11111\n1222222"
        infoLabel.lineBreakMode = .byTruncatingTail
        infoLabel.snp.makeConstraints{ make in
            make.top.equalTo(editDateLabel.snp.bottom).offset(4)
            make.bottom.equalTo(4)
            make.leading.equalTo(4)
            make.trailing.equalTo(4)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
