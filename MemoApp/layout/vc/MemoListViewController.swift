//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit
import SnapKit
import RealmSwift

class MemoListViewController: UIViewController{ //, UICollectionViewDataSource, UICollectionViewDelegate
    
    private lazy var actionSheetSort:UIAlertController = {
        let action:UIAlertController = UIAlertController(title: "정렬 방식", message: "선택한 방식으로 메모들이 정렬됩니다.", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "제목", style: .default, handler: { (action) in
            self.memoList.sort { $0.title > $1.title }
            self.collectionView.reloadData()
        }))
        action.addAction(UIAlertAction(title: "생성일", style: .default, handler: { (action) in
            self.memoList.sort { $0.createdDate > $1.createdDate }
            self.collectionView.reloadData()

        }))
        action.addAction(UIAlertAction(title: "수정일", style: .default, handler: { (action) in
            self.memoList.sort { $0.updatedDate > $1.updatedDate }
            self.collectionView.reloadData()

        }))
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
        return collectionView
    }()
    
    private lazy var memoList:[MemoDao] = {
        return realm.objects(MemoDao.self).sorted(byKeyPath: "updatedDate", ascending: false).toArray()
    }()
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        
        var toolbarItems = [UIBarButtonItem]()
    
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onButtonAddClicked(_:))))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memoList =  realm.objects(MemoDao.self).sorted(byKeyPath: "updatedDate", ascending: false).toArray()
        self.collectionView.reloadData()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MemoViewCell.self, forCellWithReuseIdentifier:"RowCell")
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터 하는 함수
        return memoList.count
        
    }
    
    
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as? MemoViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath)
        }

        cell.background.addTarget(self, action: #selector(onCellClicked(_:)), for: .touchUpInside)
        cell.setCellView(memoList[indexPath.row])
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
        self.view.safeAreaLayoutGuide.snp
    }
    
    var realm:Realm {
        try! Realm()
    }
    
    var newId:Int {
        if let ret = realm.objects(MemoDao.self).sorted(byKeyPath: "id").last?.id
        {
            return ret + 1
        }else
        {
            return 0
        }
    }
    
    func showAlert(_ title:String, _ message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension Results {
    func toArray() -> [Element] {
      return compactMap {
        $0
      }
    }
 }

