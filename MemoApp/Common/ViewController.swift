//
//  ViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
     var guide: ConstraintLayoutGuideDSL {
        self.view.safeAreaLayoutGuide.snp
    }
    
    //var binding:View? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = .white
        createSubviews()
        configureConstraints()
    }
    
    func configureNavigationBar(title: String,
                                leftItems: [UIBarButtonItem] = [UIBarButtonItem](),
                                rightItems: [UIBarButtonItem] = [UIBarButtonItem]() ) {
        guard let navigationVC = navigationController else { return }
        navigationVC.title = title
        navigationVC.isToolbarHidden = true
        self.navigationItem.setLeftBarButtonItems(leftItems, animated: true)
        self.navigationItem.setRightBarButtonItems(rightItems, animated: true)
    }
    
    func createSubviews() {
//        guard let bind = binding else { return }
//        bind.createSubviews()
    }
    
    func configureConstraints() {
//        guard let bind = binding else { return }
//        bind.configureConstraints(guide)
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}
