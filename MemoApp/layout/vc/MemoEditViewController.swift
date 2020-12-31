//
//  MemoEditViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit
import SnapKit

class MemoEditViewController: UIViewController {
    
    private var id:Int = -1
    public var memoId:Int
    {
        get{id}
        
        //TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal){
            id = newVal
            if(newVal == -1)
            {
                navigationItem.title = "새로운 메모"
            }else
            {
                navigationItem.title = "\(newVal) 수정"
            }
        }
    }
    
//    private lazy var guide:ConstraintLayoutGuideDSL = {
//        return self.view.safeAreaLayoutGuide.snp
//    }()
    
    private lazy var textView:UITextView = {
        let textView:UITextView = UITextView()
        textView.backgroundColor = .green
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        textView.text="!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n!!!\n"
        return textView
    }()
    
    private lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = UIColor(white: 0.3, alpha: 1)
//        collectionView.isOpaque = false
//        collectionView.alpha = 0.5
        collectionView.backgroundColor = .systemGray
        return collectionView
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        var toolbarItems = [UIBarButtonItem]()
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneButtonClicked(_:))))
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        setUI()
    }
    
    private func setUI(){
        self.view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.leading.equalTo(guide.leading)
            make.top.equalTo(guide.top)
            make.trailing.equalTo(guide.trailing)
            make.bottom.equalTo(0)
        }
        
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier:"RowCell")
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(guide.bottomMargin)
            make.leading.equalTo(guide.leading)
            make.trailing.equalTo(guide.trailing)
            make.height.equalTo(100)
        }
        
    }
    
    
    @objc
    private func onDoneButtonClicked(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}


extension MemoEditViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터 하는 함수
        return 10
        
    }
    
    
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as? ImageViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath)
        }

        return cell
        
    }
    
    
    
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellHeight = collectionView.frame.height
        
        return CGSize(width: collectionViewCellHeight, height: collectionViewCellHeight)
        
    }
    
    
    
    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 1
        
    }
    
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
        
    }

}

