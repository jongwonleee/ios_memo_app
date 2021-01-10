//
//  MemoDetailView.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/11.
//

import UIKit
import SnapKit

class MemoDetailView: View {
    
    private var images: [ImageDao] = [ImageDao]()
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.isScrollEnabled = true
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollViewContent: UIStackView = {
        let sv: UIStackView = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        return sv
    }()

    override func createSubviews(_ view: UIView) {
        super.createSubviews(view)
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
    }
    
    override func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {
        super.configureConstraints(guide)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
            make.leading.equalTo(guide.leading)
            make.trailing.equalTo(guide.trailing)
        }
        
        scrollViewContent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func updateImage(id:Int) {
        for i in scrollViewContent.arrangedSubviews {
            i.removeFromSuperview()
        }
        images = RealmManager.shared.getImage()?.filter("memoId = \(id)").sorted(byKeyPath: "no").toArray() ?? [ImageDao]()
        scrollViewContent.addArrangedSubview(contentLabel)
        
        for i in images {
            let imageView = UIImageView()
            let ratio = i.image!.size.width / i.image!.size.height
            imageView.image = i.image
            scrollViewContent.addArrangedSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(imageView.snp.width).dividedBy(ratio)
            }
        }
    }
}
