//
//  Model.swift
//  Calculator2
//
//  Created by Adilzhan Jumakanov on 07.03.2021.
//

import Foundation


enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double, Double)->Double)
    case equals
}


func add(op1: Double, op2: Double)->Double{
    return op1+op2
}

struct Model{
    
    var myOperation: Dictionary<String, Operation> =
    [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation(add)
    ]
    
    
    
    
    
    
    private var globalValue: Double?
    
    mutating func setOperand(_ operand: Double){
        globalValue = operand
    }
    
    mutating func performOperation(_ operation: String){
        let symbol = myOperation[operation]!
        switch symbol {
        case Operation.constant(let value):
            globalValue = value
        case Operation.unaryOperation(let function):
            globalValue = function(globalValue!)
        case .binaryOperation(let function):
        
        case .equals:
            
            
        default:
            break
        }
    }
    
    func getResult()->Double{
        return globalValue!
    }
    
    struct SaveFirstOperandAndOperation{
        let firstOperand: Double
        let operation: (Double, Double)->Double
        
        func performOperationWith()
    }
    
}

