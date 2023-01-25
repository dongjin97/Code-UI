//
//  ViewController.swift
//  CodeUI
//
//  Created by 원동진 on 2023/01/25.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    var tableView : UITableView = {
       let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identi)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubView()
        setAutoLayout()
        configure()
    }
    private func addSubView(){
        self.view.addSubview(tableView)
        
    }
    private func setAutoLayout(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension ViewController {
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
}
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identi, for: indexPath) as! TableViewCell

        return cell
         
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
import SwiftUI
@available(iOS 13.0.0, *)
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
