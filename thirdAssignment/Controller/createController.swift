//
//  createController.swift
//  thirdAssignment
//
//  Created by Lago on 2021/07/25.
//

import UIKit

let formatter : DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .long
    f.timeStyle = .short
    //f.locale = Locale(identifier: "Ko_kr")   //한국어 표시
    
    return f
}()

protocol sendBackDelegate {
    func dataRecieved(data: String)
}


class createController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editContent: UITextView!
    
    let mainVC = mainController()
    
    //for unwindSegue in mainController
    var createDelegate : sendBackDelegate?

    
    var createTitle = String()
    var createContent = String()
    var selectedMood = String()
    
    
    @IBAction func great(_ sender: UIButton) {
        selectedMood = "great"
        print(selectedMood)
    }
    @IBAction func good(_ sender: UIButton) {
        selectedMood = "good"
        print(selectedMood)
    }
    @IBAction func normal(_ sender: UIButton) {
        selectedMood = "normal"
        print(selectedMood)
    }
    @IBAction func notGood(_ sender: UIButton) {
        selectedMood = "notGood"
        print(selectedMood)
    }
    @IBAction func bad(_ sender: UIButton) {
        selectedMood = "bad"
        print(selectedMood)
    }
    
    
    
    
    //MARK: - Actions
    @IBAction func saveMemo(_ sender: UIBarButtonItem) {
        
        guard let mainVC = storyboard?.instantiateViewController(identifier: "mainController") as? mainController else { return }
        let createdMemo : Memo = Memo(title: createTitle, content: createContent, date: Date(), mood: selectedMood)
        
        mainVC.dummyMemo?.append(createdMemo)
        
        self.navigationController?.pushViewController(mainVC, animated: true)

    }
    
    
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        editTitle.text = createTitle
        editContent.text = createContent
        
        print(createTitle, "in createController")
        print(createContent,  "in createController")
        
        
    }
    
    //MARK: - Helper
    
    
    
    
}
