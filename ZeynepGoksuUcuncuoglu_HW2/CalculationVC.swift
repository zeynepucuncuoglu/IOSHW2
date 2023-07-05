//
//  CalculationVC.swift
//  ZeynepGoksuUcuncuoglu_HW2
//
//  Created by Zeynep Üçüncüoğlu on 20.11.2022.
//

import UIKit

enum Controller1: Int {
    case one = 1, two, three
}

class CalculationVC: UIViewController {
    
    
    var counter = 5
    var timer = Timer()
    var controller = Controller1.one
    
    @IBOutlet var tapGesg: UITapGestureRecognizer!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var segmentName: UISegmentedControl!
    @IBOutlet weak var calcImg: UIImageView!
    @IBOutlet weak var heightInp: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var radiusInp: UITextField!
    
    @IBAction func onSingleTap(_ sender: UITapGestureRecognizer) {
        switch (controller){
        case .one:
            segmentName.selectedSegmentIndex=1
            calcImg.image=UIImage(named: "cone")
            controller = .two
            heightLabel.isHidden=false
            heightInp.isHidden=false
            
        case .two:
            segmentName.selectedSegmentIndex=2
            calcImg.image=UIImage(named: "cylinder")
            controller = .three
            heightLabel.isHidden=false
            heightInp.isHidden=false
            
        case .three:
            segmentName.selectedSegmentIndex=0
            calcImg.image=UIImage(named: "sphere")
            controller = .one
            heightLabel.isHidden=true
            heightInp.isHidden=true
        
            
        }

        
    }
    
    
    @IBAction func onCalcSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            calcImg.image=UIImage(named: "sphere")
            controller = Controller1.one
            heightLabel.isHidden=true
            heightInp.isHidden=true
        case 1:
            calcImg.image=UIImage(named: "cone")
            controller = Controller1.two
            heightLabel.isHidden=false
            heightInp.isHidden=false
        case 2:
            calcImg.image=UIImage(named: "cylinder")
            controller = Controller1.three
            heightLabel.isHidden=false
            heightInp.isHidden=false
        default:
            break
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // Function for timer
    @objc func countDown() {
        counter = counter - 1
       
        
        if counter == 0 {
            timer.invalidate()
        
                
                // Initialization
                self.counter = 5
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CalculationVC.countDown), userInfo: nil, repeats: true)
            volume.isHidden=true
            area.isHidden=true
            calculateBtn.isEnabled = true
            segmentName.isEnabled = true
            tapGesg.isEnabled = true
            
        }
    }
    
    
    @IBAction func calcOnClick(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CalculationVC.countDown), userInfo: nil, repeats: true)
        
        counter = 5
        
        if(controller == .one){
            if(radiusInp.text!.isEmpty){
                let output = String(format: "radius is empty!!! please fill the radius field")
                displayAlert(header: "Error", msg: output)
            }else{
                obtainData()
            }
        }else{
            if(radiusInp.text!.isEmpty){
                let output = String(format: "radius is empty!!! please fill the radius field")
                displayAlert(header: "Error", msg: output)
            }else if(heightInp.text!.isEmpty){
                let output = String(format: "height is empty!!! please fill the height field")
                displayAlert(header: "Error", msg: output)
            }else{
                obtainData()
            }
        }
        
        calculateBtn.isEnabled = false
        segmentName.isEnabled = false
        tapGesg.isEnabled = false
    }
    
    
    func obtainData() {
        switch (controller){
        case .one:
            var r = Double(radiusInp.text!)!
            let sa = sphereSurfaceArea(r: r)
            let v = sphereVolume(r: r )
            area.textColor=UIColor.green
            volume.textColor=UIColor.green
            area.text=String(format: "Sphere Surface Area = %0.2f", sa)
            area.font=UIFont.boldSystemFont(ofSize: 12.0)
            volume.text=String(format: "Sphere Volume = %0.2f", v)
            volume.font=UIFont.boldSystemFont(ofSize: 12.0)
            volume.isHidden=false
            area.isHidden=false
        case .two:
            let r = Double(radiusInp.text!)!
            var h = Double(heightInp.text!)!
            let sa = coneSurfaceArea(r: r, h: h)
            let v = coneVolume(r: r, h: h)
            area.textColor=UIColor.green
            volume.textColor=UIColor.green
            area.text=String(format: "Cone Surface Area = %0.2f", sa)
            area.font=UIFont.boldSystemFont(ofSize: 12.0)
            volume.text=String(format: "Cone Volume = %0.2f", v)
            volume.font=UIFont.boldSystemFont(ofSize: 12.0)
            volume.isHidden=false
            area.isHidden=false
        case .three:
            var r = Double(radiusInp.text!)!
            var h = Double(heightInp.text!)!
            let sa = cylinderSurfaceArea(r: r, h: h)
            let v = cylinderVolume(r: r, h: h)
            volume.isHidden=false
            area.isHidden=false
            area.textColor=UIColor.green
            volume.textColor=UIColor.green
            area.text = String(format: "Cylender Surface Area = %0.2f", sa)
            area.font=UIFont.boldSystemFont(ofSize: 12.0)
            volume.text = String(format: "Cylender Volume = %0.2f", sa)
            volume.font=UIFont.boldSystemFont(ofSize: 12.0)
        }
    }
    
    func sphereSurfaceArea(r: Double) -> Double {
        return ( 4.0 * .pi * pow(r,2.0) )
    }
    
    func sphereVolume(r: Double) -> Double {
        return ( 4.0/3.0 * .pi * pow(r,3.0) )
    }
    
    func coneSurfaceArea(r: Double, h: Double) -> Double {
        return ( .pi * r * ( r + sqrt(pow(r,2.0) + pow(h,2.0)) ) )
    }
    
    func coneVolume(r: Double, h: Double) -> Double {
        return ( 1.0/3.0 * .pi * pow(r,2.0) * h )
    }
    
    func cylinderSurfaceArea(r: Double, h: Double) -> Double {
        return ( 2 * .pi * r * (h + r) )
    }
    
    func cylinderVolume(r: Double, h: Double) -> Double {
        return ( .pi * pow(r,2.0) * h )
    }
    
    func displayAlert (header: String, msg: String) {
        // Creating an Alert and display the result
        let mAlert = UIAlertController(title: header, message: msg, preferredStyle: .alert)
        // Event Handler for the button
        mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        // Displaying the Alert
        self.present(mAlert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightLabel.isHidden=true
        heightInp.isHidden=true
        volume.isHidden=true
        area.isHidden=true
        // Do any additional setup after loading the view.
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
