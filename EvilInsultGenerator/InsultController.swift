//
//  InsultController.swift
//  EvilInsultGenerator
//
//  Created by Max Gladkov on 19.07.2021.
//

import UIKit
import Alamofire

class InsultController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(insView)
        insView.snapLayout()
        Insult.fetchInsult()
        insView.insultButton.addTarget(self, action: #selector(pressNext(_:)), for: .touchUpInside)
        observeNewLabelText()
        
    }

    var insView = InsultVIew()
    
    
    //MARK: Button function
    @objc func pressNext(_ sender: UIButton){
        Insult.fetchInsult()
    }

}

extension InsultController {
    
    func observeNewLabelText() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidreceiveInsult(_:)), name: .didRecieveInsult, object: nil)
    }
    
    @objc func onDidreceiveInsult(_ notification: Notification) {
        
        if let data = notification.userInfo as? [String: String]{
            for (_, value) in data{
                insView.insultLabel.text = value
            }
        }
        else { return }
    }
}

