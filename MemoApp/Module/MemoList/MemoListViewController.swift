//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit
import SnapKit
import RealmSwift

class MemoListViewController: ViewController {
    
    // TODO string 파일로 따로 관리 (strings)

    let binding = MemoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func createSubviews() {
        let image = UIImage(named: "sort")?.resizeImage(size: CGSize(width: 20, height: 20))
        let leftItems = [UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onButtonActionSheetClicked(_:)))]
        let rightItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onButtonAddClicked(_:)))]
        
        self.configureNavigationBar(title: "List", leftItems: leftItems, rightItems: rightItems)
        
        self.binding.createSubviews(self.view)
    }
    
    override func configureConstraints() {
        self.binding.configureConstraints(guide)
        self.binding.flowLayout.cellDidClick = self.cellDidClick
    }
    
    private func cellDidClick (_ pos: Int) {
        let vc: MemoDetailViewController = MemoDetailViewController()
        vc.memoId = pos
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 램 관리 클래스 만들기
    override func viewWillAppear(_ animated: Bool) {
        binding.dataSource.loadMemo()
        binding.collectionView.reloadData()
    }

    @objc
    private func onButtonActionSheetClicked(_ sender: UIButton) {
        if !binding.actionSheetSort.isBeingPresented {
            present(binding.actionSheetSort, animated: true, completion: nil)
        }
    }
    
    @objc
    private func onButtonAddClicked(_ sender: UIButton) {
        let vc: MemoEditViewController = MemoEditViewController()
        vc.memoId = -1
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
