//
//  View.swift
//  MemoApp
//
//  Created by 이종원 on 2021/01/10.
//
import UIKit
import SnapKit

class View: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    func commonSetup() {
        //createSubviews()
        //configureConstraints()
    }
    
//    func addSubviews(_ view: UIView) {
//        createSubviews()
//        view.addSubview(view)
//    }
    
    func createSubviews(_ view: UIView) {
        view.addSubview(self)
    }
    
    func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {
        self.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
