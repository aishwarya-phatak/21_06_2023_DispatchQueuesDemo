//
//  ViewController.swift
//  21_06_2023_DispatchQueuesDemo
//
//  Created by Vishal Jagtap on 07/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewReloading()
//        concurrrentAsyncMode()
//        concurrentSyncMode()
//        serialSyncMode()
//        print("---------------------------")
//        serialAsyncMode()
    }
    func tableViewReloading(){
        let concurretQueue = DispatchQueue(label: "concurrent" ,attributes: .concurrent)
        concurretQueue.async {
            print("in ios batch \(Thread.current)")
            for _ in 1...100000{
                
            }
            DispatchQueue.main.async {
                print("tableView reloading process \(Thread.current)")
            }
            print("now outside the dispatchQueue \(Thread.current)")
        }
        print("Now outside the concurrentQueue \(Thread.current)")
    }

    func serialSyncMode(){
        let serialQueue = DispatchQueue(label: "serialQueue1")
        print(Thread.current)
        serialQueue.sync {
            print("Pallavi mam attending enquiry 1 \(Thread.current)")
            print(Thread.current)
            for _ in 1...100{
                print("thread demo")
            }
            print("Pallavi mam ended with enquiry 1")
        }
        print("Pallavi mam delegating tasks to Sachin")
        print(Thread.current)
        
        serialQueue.sync {
            print("Pallvai mam started with enquiry 2")
            print(Thread.current)
        }
        print("Pallavi mam is attending an enquiry on call")
        print(Thread.current)
    }
    
    func serialAsyncMode(){
        let serialQueue = DispatchQueue(label: "serialQueue2")
        print(Thread.current)
        
        serialQueue.async {
            print("Pallavi mam attending enquiry 1 \(Thread.current)")
            for _ in 1...10000000{
                
            }
        }
        print("Pallavi mam delegating tasks to Sachin \(Thread.current)")
        
        serialQueue.async {
            print("Pallvai mam started with enquiry 2 \(Thread.current)")
        }
        print("Pallavi mam is attending an enquiry on call \(Thread.current)")
    }
    

    func concurrentSyncMode(){
        let concurrentQueue = DispatchQueue(
                label: "concurrent",
                attributes:DispatchQueue.Attributes.concurrent)

        concurrentQueue.sync {
            print("Pallavi mam attending enquiry 1 \(Thread.current)")
            for _ in 1...10000000{
                
            }
        }
        print("Pallavi mam delegating tasks to Sachin \(Thread.current)")
        
        concurrentQueue.sync {
            print("Pallvai mam started with enquiry 2 \(Thread.current)")
            for _ in 1...1000000{
                
            }
            
        }
        print("Pallavi mam is attending an enquiry on call \(Thread.current)")
    }
    
    func concurrrentAsyncMode(){
        let concurrentQueue = DispatchQueue(label: "concurrent",attributes:DispatchQueue.Attributes.concurrent)
       
        concurrentQueue.async {
            print("Pallavi mam attending enquiry 1 \(Thread.current)")
            for _ in 1...10000{
                
            }
        }
        print("Pallavi mam delegating tasks to Sachin \(Thread.current)")
        
        concurrentQueue.async {
            print("Pallvai mam started with enquiry 2 \(Thread.current)")
            for _ in 1...100000{
                
            }
        }
        print("Pallavi mam is attending an enquiry on call \(Thread.current)")
        concurrentQueue.async {
            print("Pallvai mam started with enquiry 3 \(Thread.current)")
        }
    }
    
    
}
