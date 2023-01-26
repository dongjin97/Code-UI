//
//  TableViewCell.swift
//  CodeUI
//
//  Created by 원동진 on 2023/01/25.
//

import UIKit
import SnapKit
class TableViewCell: UITableViewCell {
    static let identi = "ViewController"
    let img : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Google")
       
        return img
    }()
    let testLabel : UILabel = {
        let testLabel = UILabel()
        testLabel.text = "Google"
        testLabel.textColor = .black
        return testLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setAutoLayout(){
        img.snp.makeConstraints { make in
            make.leading.top.equalTo(5)
            make.size.width.height.equalTo(100)
        }
        testLabel.snp.makeConstraints { make in
            make.leading.equalTo(img.snp.trailing).offset(5)
            make.top.equalTo(5)
            make.trailing.equalTo(-5).offset(5)
        }
    }
    func addContentView(){
        contentView.addSubview(img)
        contentView.addSubview(testLabel)
        
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
