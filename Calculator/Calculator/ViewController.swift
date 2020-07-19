//
//  ViewController.swift
//  Calculator
//
//  Created by 김수완 on 2020/07/18.
//  Copyright © 2020 김수완. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Value: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var numArr : [Int] = [0,]
    var signArr : [Character] = []
    var count : Int = 0
    var lastChar : Character = "0"
    
    func input(_ num : Character) -> Void {
        
        if Value.text == "0" {
            Value.text = String(num)
        }
        else {
            Value.text! += String(num)
        }
        
        if num == "+" || num == "-" || num == "×" || num == "÷"{
            if lastChar == "+" || lastChar == "-" || lastChar == "×" || lastChar == "÷" {
                let temp : String = String((Value.text!.dropLast(2)))
                Value.text = temp
                Value.text! += String(num)
                signArr[signArr.count-1] = num
            }
            else {
                signArr.append(num)
                sign()
            }
        }
        else{
            numArr[count] = numArr[count] * 10 + Int(String(num))!
        }
        lastChar = num
    }
    
    func sign() -> Void {
        count += 1
        numArr.append(0)
    }
    
    
    @IBAction func one(_ sender: Any) {
        input("1")
    }
    @IBAction func two(_ sender: Any) {
        input("2")
    }
    @IBAction func three(_ sender: Any) {
        input("3")
    }
    @IBAction func four(_ sender: Any) {
        input("4")
    }
    @IBAction func five(_ sender: Any) {
        input("5")
    }
    @IBAction func six(_ sender: Any) {
        input("6")
    }
    @IBAction func seven(_ sender: Any) {
        input("7")
    }
    @IBAction func eight(_ sender: Any) {
        input("8")
    }
    @IBAction func nine(_ sender: Any) {
        input("9")
    }
    @IBAction func zero(_ sender: Any) {
        input("0")
    }
    @IBAction func plus(_ sender: Any) {
        input("+")
    }
    @IBAction func minus(_ sender: Any) {
        input("-")    }
    @IBAction func multiply(_ sender: Any) {
        input("×")
    }
    @IBAction func division(_ sender: Any) {
        input("÷")    }
    
    @IBAction func AC(_ sender: Any) {
        for _ in 0..<numArr.count {
            numArr.remove(at: 0)
        }
        for _ in 0..<signArr.count {
            signArr.remove(at: 0)
        }
        numArr.append(0)
        Value.text = String(0)
        count = 0
    }
    
    @IBAction func equalSign(_ sender: Any) {
            
         var i = 0
           
           while i < signArr.count{
               switch signArr[i] {
                   case "×":
                       numArr[i+1] = numArr[i] * numArr[i+1]
                       numArr.remove(at: i)
                       signArr.remove(at: i)
                   case "÷":
                       numArr[i+1] = numArr[i] / numArr[i+1]
                       numArr.remove(at: i)
                       signArr.remove(at: i)
                   default:
                       i += 1
               }
           }
           
           i = 0
           
           while i < signArr.count{
               switch signArr[i] {
               case "+":
                   numArr[i+1] = numArr[i] + numArr[i+1]
                   numArr.remove(at: i)
                   signArr.remove(at: i)
               case "-":
                   numArr[i+1] = numArr[i] - numArr[i+1]
                   numArr.remove(at: i)
                   signArr.remove(at: i)
               default:
                   i += 1
               }
           }
        Value.text = String(numArr[0])
        numArr.append(0)
        count = 0
        
    }


}

