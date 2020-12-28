//
//  MemoViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit

class MemoViewCell: UICollectionViewCell {
    public var background:UIButton = UIButton()
    public var titleTV:UILabel = UILabel()
    public var editDateTV:UILabel = UILabel()
    public var infoTV:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        background.addSubview(titleTV)
        background.addSubview(editDateTV)
        background.addSubview(infoTV)
        self.contentView.addSubview(background)
        
        background.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        titleTV.numberOfLines = 2
        titleTV.text = "!!"
        titleTV.lineBreakMode = .byTruncatingTail
        titleTV.snp.makeConstraints{ make in
            make.top.equalTo(4)
            make.leading.equalTo(4)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        editDateTV.text = " 2012-02-01"
        editDateTV.snp.makeConstraints{make in
            make.top.equalTo(4)
            make.trailing.equalTo(4)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        infoTV.numberOfLines = 2
        infoTV.text = "1112\n11111\n1222222"
        infoTV.lineBreakMode = .byTruncatingTail
        infoTV.snp.makeConstraints{ make in
            make.top.equalTo(titleTV.snp.top).offset(4)
            make.bottom.equalTo(4)
            make.leading.equalTo(4)
            make.trailing.equalTo(4)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
