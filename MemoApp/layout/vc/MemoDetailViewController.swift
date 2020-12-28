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
    public var memoId:Int
    {
        get{id}
        
        //TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal){
            id = newVal
            navigationItem.title = "\(newVal)"
        }
    }
    
    private lazy var scrollView:UIScrollView = {
        let sv:UIScrollView = UIScrollView()
        sv.backgroundColor = .systemRed
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
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
            make.leading.equalTo(guide.leading)
            make.trailing.equalTo(guide.trailing)
        }
    }
    
    @objc
    private func onButtonEditClicked(_ sender:UIButton) {
        let vc:MemoEditViewController = MemoEditViewController()
        vc.memoId = id
        print("!")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
