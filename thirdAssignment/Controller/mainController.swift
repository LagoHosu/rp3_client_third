//
//  ViewController.swift
//  thirdAssignment
//
//  Created by Lago on 2021/07/23.
//

import UIKit

class mainController: UITableViewController, cellDelegate {
    func didPressButton(_ tag: Int) {
        print("I have pressed a button with a tag: \(tag)")
    }
    
    
    //MARK: - Properties
    @IBOutlet weak var table: UITableView!
    
    //for unwind segue
    var delegate: createController?
    var titleText :String = ""
    var contentText : String = ""
    var moodText : String = ""
    
    
    
    var dummyMemo : [Memo]? = [Memo(title: "Hello", content: "first memo",date: Date(), mood: "good"), Memo(title: "Bye", content: "second memo",date: Date(), mood: "bad")]
    
    //MARK: - Actions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyMemo!.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eachCell", for: indexPath) as? Cells else {
            return UITableViewCell()
        }
        
        let target = dummyMemo![indexPath.row]
        cell.titleLabel?.text = target.title
        cell.dateLabel?.text = formatter.string(from: target.date)
        cell.moodImage.image = UIImage(named: "\(target.mood)")
        
        //변수에 텍스트 대입, 후에 showController로 datapass시 쓰인다
        titleText = (cell.titleLabel?.text)!
        contentText = target.content
        moodText = target.mood
        
        cell.cellDelegate = self
        
        return cell
        
    }
    
    //when the cell is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //datapass to showVC
        guard let showVC = storyboard?.instantiateViewController(identifier: "showController") as? showController else { return }
        showVC.titleText = titleText
        showVC.content = contentText
        showVC.image = moodText
        
        print(titleText, "to showVC")
        print(contentText, "to showVC")
        
        self.navigationController?.pushViewController(showVC, animated: true)
    }
    
    
    //unwindSegue b/w createController
    var createDelegate: createController?
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        
        if let createdMemo = unwindSegue.source as? createController {
            
            let add = Memo(title: createdMemo.createTitle, content: createdMemo.createContent, date: Date(), mood: createdMemo.selectedMood)
            
            
            dummyMemo?.append(add)
            print(add.title, add.content, add.mood, "in unwind segue with createController")
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        
        table.register(UINib(nibName: "Cells", bundle: nil), forCellReuseIdentifier: "eachCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
        
    }
    
    
    //datapass to showController
    
    
    
    
    
    //MARK: - Helper
    
    
    
    
    
    
}


