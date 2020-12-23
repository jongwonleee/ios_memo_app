//
//  MemoViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit

class MemoViewCell: UICollectionViewCell {
    public var background:UIView = UIView()
    public var titleTV:UITextView = UITextView()
    public var editDateTV:UITextView = UITextView()
    public var infoTV:UITextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        background.snp.makeConstraints{ make in
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        titleTV.textContainer.maximumNumberOfLines = 2
        titleTV.textContainer.lineBreakMode = .byTruncatingTail
        titleTV.snp.makeConstraints{ make in
            make.top.equalTo(4)
            make.leading.equalTo(4)
        }
        
        editDateTV.snp.makeConstraints{make in
            make.top.equalTo(4)
            make.trailing.equalTo(4)
        }
        
        infoTV.textContainer.maximumNumberOfLines = 2
        infoTV.textContainer.lineBreakMode = .byTruncatingTail
        infoTV.snp.makeConstraints{ make in
            make.top.equalTo(titleTV.snp.top).offset(4)
            make.bottom.equalTo(4)
            make.leading.equalTo(4)
            make.trailing.equalTo(4)
        }
        
        background.addSubview(titleTV)
        background.addSubview(editDateTV)
        background.addSubview(infoTV)
        self.contentView.addSubview(background)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
