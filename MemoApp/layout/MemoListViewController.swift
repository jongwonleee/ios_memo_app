//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit
import SnapKit

class MemoListViewController: UIViewController {
    
    private lazy var guide:ConstraintLayoutGuideDSL = {
        return self.view.safeAreaLayoutGuide.snp
    }()
    
    private lazy var actionSheetSort:UIAlertController = {
        let action:UIAlertController = UIAlertController(title: "정렬 방식", message: "선택한 방식으로 메모들이 정렬됩니다.", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "제목", style: .default, handler: nil))
        action.addAction(UIAlertAction(title: "생성일", style: .default, handler: nil))
        action.addAction(UIAlertAction(title: "수정일", style: .default, handler: nil))
        action.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        return action
    }()
    
    private lazy var buttonSort:UIButton = {
        let button:UIButton = UIButton()
        button.backgroundColor = .red
        button.setImage(UIImage(named: "sort"), for: .normal)
        button.addTarget(self, action: #selector(onButtonActionSheetClicked(_:)), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var collectionView:UICollectionView = {
        let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        
        var toolbarItems = [UIBarButtonItem]()
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onButtonAddClicked)))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        
        setUI()
    }
    
    private func setUI(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(guide.trailing)
            make.leading.equalTo(guide.leading)
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
        }
        
        self.view.addSubview(buttonSort)
        buttonSort.snp.makeConstraints { make in
            make.leading.equalTo(guide.leading).offset(10)
            make.top.equalTo(guide.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }
    
    @objc
    private func onButtonActionSheetClicked(_ sender:UIButton){
        if (!actionSheetSort.isBeingPresented){
            present(actionSheetSort, animated: true, completion: nil)
        }
    }
    
    @objc
    private func onButtonAddClicked(_ sender:UIButton) {
        let vc:MemoEditViewController = MemoEditViewController()
        vc.editNo = -1
        self.navigationController?.pushViewController(vc, animated: true)
    }



}

