//
//  modifyController.swift
//  thirdAssignment
//
//  Created by Lago on 2021/07/25.
//

import UIKit

class showController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var memoTitle: UITextField!
    @IBOutlet weak var memoContent: UITextView!
    @IBOutlet weak var mood: UIImageView!
    
    var mainVC : mainController?
    
    var titleText : String = ""
    var content : String = ""
    var image : String = ""
    
    var willPassTitle : String = ""
    var willPassContent : String = ""
    
    //MARK: - Actions
    
    //datapass to createController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is createController {
            let vc = segue.destination as? createController
            vc!.createTitle = willPassTitle
            vc!.createContent = willPassContent
            vc!.selectedMood = image
            
            
        }
    }
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //mainVC?.delegate = self
        
        //get data from mainController
        memoTitle.text = titleText
        memoContent.text = content
        mood.image = UIImage(named: "\(image)")
        
        willPassTitle = memoTitle.text!
        willPassContent = memoContent.text!
        

        //make the text unable to edit on this VC
        memoTitle.allowsEditingTextAttributes = false
        memoContent.allowsEditingTextAttributes = false
        

    }
    
    
    
    
    //MARK: - Helper
    
    
    
    
}
