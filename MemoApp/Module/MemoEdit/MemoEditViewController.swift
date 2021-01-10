//
//  MemoEditViewController.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/23.
//

import UIKit
import SnapKit

class MemoEditViewController: ViewController {
    
    private var id: Int = -1
    private var memo: MemoDao = MemoDao()
    private let binding: MemoEditView = MemoEditView()
    
    public var memoId: Int {
        get {id}
        // TODO 나중에 숫자가 아니라 dao로 변경하기
        set(newVal) {
            id = newVal
            if newVal == -1 {
                navigationItem.title = "새로운 메모"
            } else {
                memo = realm.objects(MemoDao.self).filter("id = \(id)").first!
                binding.textView.text = "\(memo.title)\n\(memo.content ?? "")"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var toolbarItems = [UIBarButtonItem]()
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDoneButtonClicked(_:))))
        toolbarItems.append(UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(onImageButtonClicked(_:))))
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.setRightBarButtonItems(toolbarItems, animated: true)
        
        configureNavigationBar(title: memo.title, leftItems: [UIBarButtonItem](), rightItems: toolbarItems)
        
    }
    
    override func createSubviews() {
        binding.picker.delegate = self
        binding.createSubviews(self.view)
    }
    
    override func configureConstraints() {
        binding.configureConstraints(guide)
    }
    
    @objc
    private func onImageButtonClicked(_ sender: UIButton) {
        if !binding.actionSheet.isBeingPresented && binding.dataSource.images.count < 10 {
            present(binding.actionSheet, animated: true, completion: nil)
        }
    }
    
    @objc
    private func onDoneButtonClicked(_ sender: UIButton) {
        if binding.textView.text.trimmingCharacters(in: .whitespacesAndNewlines).count > 10000 {
            showAlert("최대 글자 수를 초과하였습니다", "")
            return
        }
        
        if binding.textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            showAlert("내용을 입력하세요", "")
            return
        }
        
        if id == -1 {
            memo.createdDate = memo.updatedDate
            memo.id = newId
            setMemo()
            
            RealmManager.shared.addMemo(memo)
        } else {
            //RealmManager.shared.updateMemo(memo)
            try? realm.write({
                setMemo()
                realm.add(memo, update: .modified)
            })
        }
        
        var new: [ImageDao] = [ImageDao]()
        for i in 0 ... binding.dataSource.images.count-1 {
            let tmp = ImageDao()
            tmp.data = (binding.dataSource.images[i].image?.pngData())!
            tmp.url = binding.dataSource.images[i].url
            tmp.memoId = memo.id
            tmp.no = i
            new.append(tmp)
        }
        
        let old = realm.objects(ImageDao.self).filter("memoId = \(id)")
        
        try? realm.write({
            realm.delete(old)
            realm.add(new)
        })
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setMemo() {
        let enter = binding.textView.text.firstIndex(of: "\n")
        if enter == nil {
            memo.title = String(binding.textView.text.trimmingCharacters(in: .whitespacesAndNewlines))
            memo.content = nil
        } else {
            memo.title = String(binding.textView.text[...enter!].trimmingCharacters(in: .whitespacesAndNewlines))
            memo.content = String(binding.textView.text[enter!...].trimmingCharacters(in: .whitespacesAndNewlines))
        }
        memo.updatedDate = Date()
    }
}

extension MemoEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // TODO jpeg로 포맷 압축
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
            let url = (info[UIImagePickerController.InfoKey.imageURL] as? NSURL)?.absoluteString
        else { return }
        
        for i in binding.dataSource.images {
            if  i.url == url {
                showAlert("", "중복된 이미지입니다")
                return
            }
        }
        
        let imageDao = ImageDao()
        imageDao.url = url
        imageDao.data = image.jpegData(compressionQuality: 0.5)!
        binding.dataSource.images.append(imageDao)
        binding.collectionView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
