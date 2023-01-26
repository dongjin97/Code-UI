//
//  ExCollectionViewController.swift
//  CodeUI
//
//  Created by 원동진 on 2023/01/27.
//

import UIKit

class ExCollectionVC: UIViewController {
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout:layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        autoLayout()
        configureCV()
        setupCollectionView()
        
    }
    func addSubView(){
        self.view.addSubview(collectionView)
    }
    func autoLayout(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureCV(){
        collectionView.register(ExCVCell.self, forCellWithReuseIdentifier: ExCVCell.CVidenti)
    }
    private func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}
extension ExCollectionVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExCVCell.CVidenti, for: indexPath) as! ExCVCell
        cell.backgroundColor = .blue
        return cell
    }
}
import SwiftUI
@available(iOS 13.0.0, *)
struct ExCollectionVCRepresentable: UIViewControllerRepresentable {
    typealias ExCollectionVCType = ExCollectionVC
    
    func makeUIViewController(context: Context) -> ExCollectionVC {
        return ExCollectionVC()
    }
    
    func updateUIViewController(_ uiViewController: ExCollectionVC, context: Context) {
    }
}
struct ExCollectionVCViewPreview: PreviewProvider {
    static var previews: some View {
        ExCollectionVCRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
