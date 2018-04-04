//
//  ViewController.swift
//  Fibonacci
//
//  Created by John Lima on 03/04/18.
//  Copyright © 2018 limadeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // MARK: - Constantes
   private let kMinValue = 1
   private let kMaxValue = 1000
   private let kAlertActionTitleButton = "Ok"
   private let kAlertTitleError = "Erro"
   private let kAlertMessageErrorNoData = "Entre com algum número inteiro que seja maior ou igual a 1 e menor ou igual a 1000."
   private let kAlertTitleResult = "Resultado"
   
   // MARK: - Properties
   @IBOutlet  private weak var inputTexField: UITextField!
   
   // MARK: -  Overrides
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
   
   // MARK: - Private Methods
   @IBAction private func calculate(_ sender: Any) {
      inputTexField.resignFirstResponder()
      if let textValue = inputTexField.text, isValid(input: textValue) {
         let number = Int(textValue) ?? Int()
         let resultValue = self.fibonacci(number)
         self.showAlert(title: self.kAlertTitleResult, message: String(resultValue))
         return
      }
      showAlert(title: kAlertTitleError, message: kAlertMessageErrorNoData)
   }
   
   private func isValid(input value: String) -> Bool {
      let number = Int(value) ?? Int()
      if number >= kMinValue && number <= kMaxValue  {
         return true
      }
      return false
   }
   
   private func fibonacci(_ number: Int) -> String {
      var sum: Double = 0
      var i: Double = 0
      var j: Double = 1
      for _ in 0 ..< number {
         (i, j) = (j, i + j)
         sum += i
      }
      let string = String(sum).replacingOccurrences(of: ".0", with: "")
      return string
   }
   
   private func showAlert(title: String?, message: String?) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let dismissAction = UIAlertAction(title: kAlertActionTitleButton, style: .default, handler: nil)
      alert.addAction(dismissAction)
      DispatchQueue.main.async { [unowned self] in
         self.present(alert, animated: true, completion: nil)
      }
   }
}
