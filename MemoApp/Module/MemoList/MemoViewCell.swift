//
//  MemoViewCell.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit
import RealmSwift

// TODO 배경 blur 하기

class MemoViewCell: UICollectionViewCell {
    public static let identifier:String = "MemoCell"
    public var background: UIImageView = UIImageView()
    private var titleLabel: UILabel = UILabel()
    private var editDateLabel: UILabel = UILabel()
    private var infoLabel: UILabel = UILabel()
    private var view: UIView = UIView()
    private var stackView: UIStackView = {
         let sv: UIStackView = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        return sv
    }()
    
    // configure
    public func setCellView(_ memo: MemoDao) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        background.tag = memo.id
        titleLabel.text = memo.title
        editDateLabel.text = dateFormatter.string(from: memo.updatedDate)
        infoLabel.text = memo.content

        if let image = try? Realm().objects(ImageDao.self).filter("memoId = \(memo.id)").first {
            background.layer.cornerRadius = 20.0
            background.layer.masksToBounds = true
            background.image = image.image
        } else {
            background.image = nil
            background.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.background.frame
        background.addSubview(view)
        self.background.addSubview(visualEffectView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(editDateLabel)
        stackView.addArrangedSubview(infoLabel)
        background.addSubview(stackView)

        self.contentView.addSubview(background)
        
        background.backgroundColor = .white
        background.snp.makeConstraints { make in
            make.top.equalTo(0).inset(8)
            make.bottom.equalTo(0)
            make.leading.equalTo(0).inset(4)
            make.trailing.equalTo(0).inset(4)
        }
        
        stackView.backgroundColor = .none
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.lessThanOrEqualToSuperview().offset(-16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints { make in
            // make.height.lessThanOrEqualTo(40)
        }
        
        editDateLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        editDateLabel.snp.makeConstraints {make in
            // make.height.lessThanOrEqualTo(20)
        }
        
        infoLabel.numberOfLines = 2
        infoLabel.lineBreakMode = .byTruncatingTail
        infoLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-4)
        }
        
//        view.backgroundColor = .white
//        view.alpha = 0.5
        view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalTo(stackView).offset(16)
        }

        background.layoutIfNeeded()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
