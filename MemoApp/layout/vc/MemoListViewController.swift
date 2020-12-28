//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit
import SnapKit

class MemoListViewController: UIViewController{ //, UICollectionViewDataSource, UICollectionViewDelegate
    
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
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView:UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBlue
        return collectionView
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        
        var toolbarItems = [UIBarButtonItem]()
    
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onButtonAddClicked(_:))))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        setUI()
    }
    
    private func setUI(){
        self.view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MemoViewCell.self, forCellWithReuseIdentifier:"RowCell")
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
        vc.memoId = -1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}


extension MemoListViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터 하는 함수
        return 100
        
    }
    
    
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as? MemoViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath)
        }

        cell.background.backgroundColor = .white
        cell.background.tag = indexPath.row
        cell.background.addTarget(self, action: #selector(onCellClicked(_:)), for: .touchUpInside)
        cell.titleLabel.text = "\(indexPath.row)\nhihi\nbyby"
        return cell
        
    }
    
    
    
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 2 - 1
        
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)
        
    }
    
    
    
    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 1
        
    }
    
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    
    @objc
    func onCellClicked(_ sender:UIButton) {
        let vc:MemoDetailViewController = MemoDetailViewController()
        vc.memoId = sender.tag
        self.navigationController?.pushViewController(vc, animated: true)

    }
}


extension UIViewController {
//    private func guide() -> ConstraintLayoutGuideDSL {
//        return self.view.safeAreaLayoutGuide.snp
//    }
    
    var guide:ConstraintLayoutGuideDSL {
        get {
            self.view.safeAreaLayoutGuide.snp
        }
    }
}
