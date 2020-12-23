//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let actionSheetSort:UIAlertController = UIAlertController(title: "정렬 방식", message: "선택한 방식으로 메모들이 정렬됩니다.", preferredStyle: .actionSheet)
    let buttonSort:UIButton = UIButton()
    let buttonAdd:UIButton = UIButton()
    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
    let imagePlus:UIImage? = UIImage(named: "plus")
    let imageSort:UIImage? = UIImage(named: "sort")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let guide = self.view.safeAreaLayoutGuide.snp
        // Do any additional setup after loading the view.
        actionSheetSort.addAction(UIAlertAction(title: "제목", style: .default, handler: nil))
        actionSheetSort.addAction(UIAlertAction(title: "생성일", style: .default, handler: nil))
        actionSheetSort.addAction(UIAlertAction(title: "수정일", style: .default, handler: nil))
        actionSheetSort.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { make in
            make.trailing.equalTo(guide.trailing)
            make.leading.equalTo(guide.leading)
            make.top.equalTo(guide.top)
            make.bottom.equalTo(0)
        }
        
        self.view.addSubview(buttonSort)
        buttonSort.backgroundColor = .red
        buttonSort.setImage(imageSort, for: .normal)
        buttonSort.snp.makeConstraints { make in
            make.leading.equalTo(guide.leading).offset(10)
            make.top.equalTo(guide.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        buttonSort.addTarget(self, action: #selector(onButtonActionSheetClicked), for: .touchUpInside)
        
        self.view.addSubview(buttonAdd)
        buttonAdd.backgroundColor = .blue
        buttonAdd.setImage(imagePlus, for: .normal)
        buttonAdd.snp.makeConstraints { make in
            make.trailing.equalTo(guide.trailing).offset(-10)
            make.top.equalTo(guide.top).offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        
    }
    
    @objc
    func onButtonActionSheetClicked(sender:UIButton){
        if (!actionSheetSort.isBeingPresented){
            present(actionSheetSort, animated: true, completion: nil)
        }
    }



}

