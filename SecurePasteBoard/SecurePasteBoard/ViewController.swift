//
//  ViewController.swift
//  SecurePasteBoard
//
//  Created by Esmeraldi Bejolli on 10/06/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import UIKit
import  Foundation
class ViewController: UIViewController {

    @IBOutlet weak var secureView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: OperationQueue.main, using: {
            _ in
            print("In Background")
            self.secureView.text = "I replaced secret Content"
        })
        
          NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: OperationQueue.main, using: {
                 _ in
                 print("In Background")
            self.secureView.text = "I am very secret content!"
             })
    }

    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }
    
}

