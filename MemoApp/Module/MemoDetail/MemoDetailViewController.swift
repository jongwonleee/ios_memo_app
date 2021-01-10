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
    
    public var memo: MemoDao = MemoDao()
    private let binding: MemoDetailView = MemoDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMemo()
        let toolbarItems = [UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onButtonEditClicked(_:)))]
        self.configureNavigationBar(title: memo.title, leftItems: [UIBarButtonItem](), rightItems: toolbarItems)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateMemo()
        binding.updateImage(id: memo.id)
    }
    
    override func createSubviews() {
        binding.createSubviews(self.view)
    }
    
    override func configureConstraints() {
        binding.configureConstraints(guide)
    }
    
    private func updateMemo() {
        guard let newMemo = RealmManager.shared.getMemo()?.filter("id = \(memo.id)").first else {
            showAlert("오류", "메모를 불러올 수 없습니다. 다시 한번 시도해주세요")
            self.navigationController?.popViewController(animated: true)
            return
        }
        
        memo = newMemo
        binding.contentLabel.text = "\(memo.title)\n\(memo.content ?? "")"
    }

    @objc
    private func onButtonEditClicked(_ sender: UIButton) {
        let vc: MemoEditViewController = MemoEditViewController()
        vc.memoId = memo.id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
