//
//  MemoViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit

class MemoViewCell: UICollectionViewCell {
    public var background:UIButton = UIButton()
    private var titleLabel:UILabel = UILabel()
    private var editDateLabel:UILabel = UILabel()
    private var infoLabel:UILabel = UILabel()
    
    public func setCellView(_ memo:MemoDao){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        background.tag = memo.id
        titleLabel.text = memo.title
        editDateLabel.text = dateFormatter.string(from: memo.updatedDate)
        infoLabel.text = memo.content
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        background.addSubview(titleLabel)
        background.addSubview(editDateLabel)
        background.addSubview(infoLabel)
        self.contentView.addSubview(background)
        
        background.backgroundColor = .white
        background.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(4)
            make.leading.equalTo(4)
            make.trailing.equalTo(-4)
            make.height.lessThanOrEqualTo(40)
        }
        
        editDateLabel.textColor = .gray
        editDateLabel.snp.makeConstraints{make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.trailing.equalTo(-4)
            make.leading.equalTo(4)
            make.height.lessThanOrEqualTo(20)
        }
        
        infoLabel.numberOfLines = 2
        infoLabel.lineBreakMode = .byTruncatingTail
        infoLabel.snp.makeConstraints{ make in
            make.top.equalTo(editDateLabel.snp.bottom).offset(4)
            make.bottom.equalTo(-4)
            make.leading.equalTo(4)
            make.trailing.equalTo(-4)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
