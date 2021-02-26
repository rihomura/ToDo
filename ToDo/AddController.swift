//
//  AddController.swift
//  ToDo
//
//  Created by 村上理保 on 2021/01/22.
//

import UIKit

//変数の設置
var TodoKobetsunonakami = [String]()



class AddController: UIViewController {
    
    let saveData = UserDefaults.standard
    //テキストFieldの設定
    @IBOutlet weak var TodoTextField: UITextField!
    
    //追加ボタンの設定
    @IBAction func TodoAddButton(_ sender: Any) {
        //変数に入力内容を入れる
        TodoKobetsunonakami.append(TodoTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        TodoTextField.text = ""
        //変数の中身をUDに追加
        saveData.set( TodoKobetsunonakami, forKey: "ToDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
