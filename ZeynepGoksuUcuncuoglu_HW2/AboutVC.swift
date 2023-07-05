//
//  AboutVC.swift
//  ZeynepGoksuUcuncuoglu_HW2
//
//  Created by Zeynep Üçüncüoğlu on 15.11.2022.
//

import UIKit

class AboutVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    var titleText = ""
    var titleColor =   UIColor.gray
    var titleBackgroundColor = UIColor.gray
    var titleFont = UIFont()
    var bodyText = ""
    var bodyColor =   UIColor.gray
    //var btnText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text=titleText
        titleLabel.font=titleFont
        titleLabel.textColor=titleColor
        titleLabel.backgroundColor=titleBackgroundColor
        bodyLabel.text=bodyText
        bodyLabel.textColor=bodyColor
       // closeBtn.titleLabel=btnText
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
