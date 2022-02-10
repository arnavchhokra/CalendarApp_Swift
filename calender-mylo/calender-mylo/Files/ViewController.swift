//
//  ViewController.swift
//  calender-mylo
//
//  Created by Arnav on 27/01/22.
//

import UIKit
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    //  var collectionView: UICollectionViewDelegate!
    var data = Data()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsMultipleSelection = false
        
        data.CurrentMonth = Calendar.current.component(.month, from: Date())
        data.CurrentMonth -= 1
        let CurrentYear = Calendar.current.component(.year, from: Date())
        MonthLbl.text = "\(data.Month[data.CurrentMonth]) \(CurrentYear)"
        
        
        
        let CurrentDate = Calendar.current.component(.day, from: Date())
        print(CurrentDate)
        if( data.CurrentMonth == 1 && data.CurrentYear % 4 == 0)
        {
            data.DaysInMonth[data.CurrentMonth] = 29
        }
        data.LastWeekDay = 31 - data.DaysInMonth[data.CurrentMonth]
        while(data.LastWeekDay != 0)
        {
            data.DateArray2.removeLast()
            data.LastWeekDay = data.LastWeekDay-1
        }
        
        
        var DateComponents = DateComponents()
        DateComponents.year = CurrentYear
        DateComponents.month = data.CurrentMonth + 1
        //       dateComponents.day = 1
        
        
        
        let Date = Calendar.current.date(from: DateComponents)!
        let Calendar = Calendar.current
        //   let day = calendar.dateComponents([.day], from: date)
        //  var today = day.day!
        
        let Components = Calendar.dateComponents([.weekday], from: Date)
        var DayOfWeek = Components.weekday! - 1
        
        
        while(DayOfWeek != 0)
        {
            data.ResultArray.append(contentsOf: data.BlankArray)
            DayOfWeek -= 1
            
        }
        data.ResultArray.append(contentsOf: data.DateArray2)
        
        
        
        
        
        
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil ) , forCellWithReuseIdentifier: "ItemCell")
        
    }
    
    
    
    
    
    @IBOutlet weak var MonthLbl: UILabel!
    
    @IBAction func Left_button(_ sender: Any) {
        data.LeftButton()
        MonthLbl.text = "\(data.Month[data.CurrentMonth]) \(data.CurrentYear)"
        collectionView.reloadData()
    }
    
    
    @IBAction func swipeleft(_ sender: UISwipeGestureRecognizer) {
        data.RightButton()
        MonthLbl.text = "\(data.Month[data.CurrentMonth]) \(data.CurrentYear)"
        collectionView.reloadData()
    }
    
    
    @IBAction func swiperight(_ sender: UISwipeGestureRecognizer) {
        data.LeftButton()
        MonthLbl.text = "\(data.Month[data.CurrentMonth]) \(data.CurrentYear)"
        
        collectionView.reloadData()
    }
    
    @IBAction func Right_button(_ sender: Any) {
        data.RightButton()
        MonthLbl.text = "\(data.Month[data.CurrentMonth]) \(data.CurrentYear)"
        collectionView.reloadData()
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.data.ResultArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        Cell.setData(text: self.data.ResultArray[indexPath.row])
        Cell.layer.cornerRadius = Cell.frame.height/2;
        Cell.backgroundColor = UIColor.link
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








