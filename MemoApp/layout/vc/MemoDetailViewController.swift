//
//  MemoDetailViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import Foundation
import UIKit
import SnapKit

class MemoDetailViewController: UIViewController {
    
    private var id:Int = -1
    private var memo:MemoDao = MemoDao()
    public var memoId:Int
    {
        get{id}
        
        //TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal){
            id = newVal
            memo = realm.objects(MemoDao.self).filter("id = \(id)").toArray()[0]
            navigationItem.title = memo.title
            textView.text = "\(memo.title)\n\(memo.content ?? "")"
        }
    }
    
    private let scrollView:UIScrollView = {
        let sv:UIScrollView = UIScrollView()
        sv.isScrollEnabled = true
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let textView:UILabel = {
        let tv:UILabel = UILabel()
        tv.font = tv.font.withSize(20)
        tv.numberOfLines = 0
        tv.lineBreakMode = .byWordWrapping
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let scrollViewContent:UIStackView = {
        let sv:UIStackView = UIStackView()
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
    
    private func setUI(){
        
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContent)
        scrollViewContent.addArrangedSubview(textView)

        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
            make.leading.equalTo(guide.leading)
            make.trailing.equalTo(guide.trailing)
        }
        
        scrollViewContent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.leading.equalTo(8)
            make.trailing.equalTo(8)
            make.height.greaterThanOrEqualTo(0)
        }
        
        //scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
    }
    
    @objc
    private func onButtonEditClicked(_ sender:UIButton) {
        let vc:MemoEditViewController = MemoEditViewController()
        vc.memoId = id
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
