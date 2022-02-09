//
//  ViewController.swift
//  calender-mylo
//
//  Created by Arnav on 27/01/22.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    let Month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31] // cant make this constant due to line 39
    var CurrentYear: Int = 2021
    var CurrentMonth: Int = 0
    var FirstWeekDayOfMonth = 0
    let DateArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    var DateArray2 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var LastWeekDay: Int = 0
    var BlankArray = [" "]
    var ResultArray = [String]()
  //  var collectionView: UICollectionViewDelegate!
    
    
    
        
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        CurrentMonth = Calendar.current.component(.month, from: Date())
        CurrentMonth -= 1
        CurrentYear = Calendar.current.component(.year, from: Date())
        MonthLbl.text = "\(Month[CurrentMonth]) \(CurrentYear)"
        if( CurrentMonth == 1 && CurrentYear % 4 == 0)
        {
            DaysInMonth[CurrentMonth] = 29
        }
        LastWeekDay = 31 - DaysInMonth[CurrentMonth]
        while(LastWeekDay != 0)
        {
            DateArray2.removeLast()
            LastWeekDay=LastWeekDay-1
        }
        
        
        var dateComponents = DateComponents()
        dateComponents.year = CurrentYear
        dateComponents.month = CurrentMonth + 1
        dateComponents.day = 1

        
        
        let date = Calendar.current.date(from: dateComponents)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        while(dayOfWeek != 0)
        {
            ResultArray.append(contentsOf: BlankArray)
            dayOfWeek -= 1
            
        }
        ResultArray.append(contentsOf: DateArray2)
        

    
        
        

            
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil ) , forCellWithReuseIdentifier: "ItemCell")
        
     }
    
    func  LeftButton()
    {
        ResultArray = []
        DateArray2 = DateArray
        CurrentMonth -= 1
        if(CurrentMonth < 0)
        {
            CurrentYear -= 1
            CurrentMonth = 11
        }


        MonthLbl.text = "\(Month[CurrentMonth]) \(CurrentYear)"
        if( CurrentMonth == 1 && CurrentYear % 4 == 0)
        {
            DaysInMonth[CurrentMonth] = 29
        }
        LastWeekDay = 31 - DaysInMonth[CurrentMonth]
        while(LastWeekDay != 0)
        {
            DateArray2.removeLast()
            LastWeekDay = LastWeekDay - 1
        }
        var dateComponents = DateComponents()
        dateComponents.year = CurrentYear
        dateComponents.month = CurrentMonth + 1
        dateComponents.day = 1

        
        
        let date = Calendar.current.date(from: dateComponents)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        
        while(dayOfWeek != 0)
        {
            ResultArray.append(contentsOf: BlankArray)
            dayOfWeek -= 1
            
        }
        ResultArray.append(contentsOf: DateArray2)
        
        collectionView.reloadData()

    }
    
    
    func RightButton()
    {
        ResultArray = []
    DateArray2 = DateArray
    CurrentMonth += 1
    if(CurrentMonth > 11)
    {
        CurrentYear+=1
        CurrentMonth=0
    }
        MonthLbl.text = "\(Month[CurrentMonth]) \(CurrentYear)"
        if( CurrentMonth == 1 && CurrentYear % 4 == 0)
        {
            DaysInMonth[CurrentMonth] = 29
        }
        LastWeekDay = 31 - DaysInMonth[CurrentMonth]
        while(LastWeekDay != 0)
        {
            DateArray2.removeLast()
            LastWeekDay = LastWeekDay-1
        }
        var dateComponents = DateComponents()
        dateComponents.year = CurrentYear
        dateComponents.month = CurrentMonth + 1
        dateComponents.day = 1

        
        
        let date = Calendar.current.date(from: dateComponents)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        
        while(dayOfWeek != 0)
        {
            ResultArray.append(contentsOf: BlankArray)
            dayOfWeek -= 1
        }
        ResultArray.append(contentsOf: DateArray2)
        
        
        collectionView.reloadData()
        }
    
    
    
    @IBOutlet weak var MonthLbl: UILabel!
    
    @IBAction func Left_button(_ sender: Any) {
        LeftButton()
    }
    
    
    @IBAction func swipeleft(_ sender: UISwipeGestureRecognizer) {
        RightButton()
    }
    
    
    @IBAction func swiperight(_ sender: UISwipeGestureRecognizer) {
        LeftButton()
    }
    
    @IBAction func Right_button(_ sender: Any) {
        RightButton()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
     return self.ResultArray.count
     }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
         Cell.setData(text: self.ResultArray[indexPath.row])
        Cell.layer.cornerRadius = Cell.frame.height/2;
         return Cell
         
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let SelectedCell = collectionView.cellForItem(at: indexPath)
        {

            SelectedCell.contentView.backgroundColor = UIColor(red:1, green: 0, blue: 0, alpha: 0.66 )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let SelectedCell = collectionView.cellForItem(at: indexPath)
        {
            SelectedCell.contentView.backgroundColor = UIColor.link
        }
    }
 
    
    
    
    @IBOutlet weak var weekday_stack: UIStackView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}








