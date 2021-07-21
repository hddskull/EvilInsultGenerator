//
//  InsultVIew.swift
//  EvilInsultGenerator
//
//  Created by Max Gladkov on 19.07.2021.
//

import UIKit
import SnapKit

class InsultVIew: UIView {

    
    //MARK: Properties
    
    let insultLabel = UILabel()
    let insultButton = UIButton()
    
}

extension InsultVIew {
    
    //MARK: Snap Constraints
    
    func snapLayout(){
        superview?.backgroundColor = .white
        
        superview!.addSubview(insultLabel)
        
        insultLabel.backgroundColor = .systemTeal
        insultLabel.textAlignment = .center
        insultLabel.font = UIFont(name: "AmericanTypewriter", size: 18)
        insultLabel.textColor = .white
        insultLabel.clipsToBounds = true
        insultLabel.layer.cornerRadius = 12
        insultLabel.numberOfLines = 5
        
        insultLabel.snp.makeConstraints { (make)->Void in
            make.top.equalTo(superview!.snp.top).offset(100)
            make.leading.trailing.equalTo(superview!).inset(15)
            make.height.equalTo(300)
        }
        
        superview?.addSubview(insultButton)
        
        insultButton.backgroundColor = .systemTeal
        insultButton.setTitle( "Next", for: .normal)
        insultButton.setTitleColor(.white, for: .normal)
        insultButton.clipsToBounds = true
        insultButton.layer.cornerRadius = 12
        
        insultButton.snp.makeConstraints{ (make)->Void in
            make.bottom.equalTo(superview!.snp.bottomMargin)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
    }
}
