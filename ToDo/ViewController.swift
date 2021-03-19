//
//  ViewController.swift
//  ToDo
//
//  Created by 村上理保 on 2021/01/16.
//

import UIKit

//classの継承を追加
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoKobetsunonakami.count
    }
    
    let saveData = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 40
        
        tableView.delegate = self
                tableView.dataSource = self
        
        //追加画面で入力した内容を取得する
        
        
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {

        if saveData.object(forKey: "ToDoList") != nil {
            TodoKobetsunonakami = saveData.object(forKey: "ToDoList") as! [String]
        }
            

            tableView.reloadData()
        }
    
    //UITableView、cellforRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定
        return TodoCell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }


    // 追加：セルの削除機能
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                //ToDo.remove(at: indexPath.row)
                TodoKobetsunonakami.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                saveData.set(TodoKobetsunonakami, forKey: "ToDoList")
                
        }
    }
    
    //    butten
    var startingFrame : CGRect!
    var endingFrame : CGRect!
    
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) && self.button.isHidden {
             self.button.isHidden = false
             self.button.frame = startingFrame
             UIView.animate(withDuration: 1.0) {
              self.button.frame = self.endingFrame
             }
            }
        }
        func configureSizes() {
            let screenSize = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height

            startingFrame = CGRect(x: 0, y: screenHeight+100, width: screenWidth, height: 100)
            endingFrame = CGRect(x: 0, y: screenHeight-100, width: screenWidth, height: 100)


        }



   


}
