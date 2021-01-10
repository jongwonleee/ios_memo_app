//
//  MemoDetailViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import Foundation
import UIKit
import SnapKit

class MemoDetailViewController: ViewController {
    
    private var id: Int = -1
    private var memo: MemoDao = MemoDao()
    public var memoId: Int {
        get {id}
        
        // TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal) {
            id = newVal
            updateData()
        }
    }
    private var images: [ImageDao] = [ImageDao]()
    
    // TODO scrollView 잘 안쓰이고 collectionView section 2개로 변경 가능
    private let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.isScrollEnabled = true
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollViewContent: UIStackView = {
        let sv: UIStackView = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        return sv
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        var toolbarItems = [UIBarButtonItem]()
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onButtonEditClicked(_:))))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if id != -1 {
            updateData()
            updateImage()
        }
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
        
        // updateImage()

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
    
    @objc
    private func onButtonEditClicked(_ sender: UIButton) {
        let vc: MemoEditViewController = MemoEditViewController()
        vc.memoId = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func updateData() {
        memo = realm.objects(MemoDao.self).filter("id = \(id)").first!
        navigationItem.title = memo.title
        contentLabel.text = "\(memo.title)\n\(memo.content ?? "")"
    }
    
    private func updateImage() {
        for i in scrollViewContent.arrangedSubviews {
            i.removeFromSuperview()
        }
        
        images = realm.objects(ImageDao.self).filter("memoId = \(id)").sorted(byKeyPath: "no").toArray()
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
