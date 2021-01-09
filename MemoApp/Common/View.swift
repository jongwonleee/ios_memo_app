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
        createSubviews()
        //configureConstraints()
    }
    
    func createSubviews() {}
    
    func configureConstraints(_ guide: ConstraintLayoutGuideDSL) {}
}
