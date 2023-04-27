//
//  ViewController.swift
//  CalculatorApp
//
//  Created by STC on 17/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var workingLabel: UILabel!
   
    @IBOutlet weak var resultLabel: UILabel!
    
    var working : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    func clearAll(){
     working = ""
        workingLabel.text = ""
        resultLabel.text = ""
    }
    
    @IBAction func AllClearBtn(_ sender: Any) {
        clearAll()
    }
    func addToWorking(value : String){
        working = working + value
        workingLabel.text = working
    }
    @IBAction func clearBtn(_ sender: Any) {
        if(!working.isEmpty){
            working.removeLast()
            workingLabel.text = working
        }
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        addToWorking(value:"/")
    }
    
    
    @IBAction func perBtn(_ sender: Any) {
        addToWorking(value:"%")
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        addToWorking(value:"7")
    }
    
    
    @IBAction func eightBtn(_ sender: Any) {
        addToWorking(value:"8")
    }
    
    
    @IBAction func nineBtn(_ sender: Any) {
        addToWorking(value:"9")
    }
    
    @IBAction func multiBtn(_ sender: Any) {
        addToWorking(value:"*")
    }
    
    @IBAction func fourBtn(_ sender: Any) {
        addToWorking(value:"4")
    }
    
    @IBAction func fiveBtn(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    @IBAction func sixBtn(_ sender: Any) {
        addToWorking(value:"6")
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        addToWorking(value:"-")
    }
    
    @IBAction func oneBtn(_ sender: Any) {
        addToWorking(value: "1")
    }
    
    @IBAction func twoBtn(_ sender: Any) {
        addToWorking(value:"2")
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        addToWorking(value:"3")
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        addToWorking(value:"+")
    }
    
    @IBAction func decimalBtn(_ sender: Any) {
        addToWorking(value:".")
        
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        addToWorking(value:"0")
    }
    
    
    @IBAction func equalBtn(_ sender: Any) {
        if(validInput()){
            let checkforWorking = working.replacingOccurrences(of: "%", with: "0.01")
            let expression = NSExpression(format: checkforWorking)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatresult(result: result)
            resultLabel.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator To Do Math Based On Input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true,completion: nil)
        }
        
    }
    func validInput() -> Bool{
        var count = 0
        var funccharindex = [Int]()
        for char in working{
            if specialCharacter(char: char){
                funccharindex.append(count)
            }
            count += 1
        }
        var previus : Int = -1
        for index in funccharindex{
            if index == 0{
                return false
            }
            if index == working.count - 1{
              return false
            }
            if previus != -1{
                if (index - previus == 1){
                    return false
                }
            }
            previus = index
        }
        return true
    }
    func specialCharacter(char : Character)-> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
       return false
    }
    func formatresult(result: Double)-> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    
    
    
    
    
    
    
    


}

