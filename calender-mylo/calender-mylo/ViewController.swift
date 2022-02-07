//
//  ViewController.swift
//  calender-mylo
//
//  Created by Arnav on 27/01/22.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDataSource {
    let Month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var daysinMonth = [31,28,31,30,31,30,31,31,30,31,30,31] // cant make this constant due to line 39
    var currentYear: Int = 2021
    var currentMonth: Int = 0
    var firstWeekdayOfMonth = 0
    let dateArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    var dateArray2 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var q: Int = 0
    var blank_arr = [" "]
    var new_arr = [String]()
    
        
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        currentMonth = Calendar.current.component(.month, from: Date())
        currentMonth -= 1
        currentYear = Calendar.current.component(.year, from: Date())
        MonthLbl.text = "\(Month[currentMonth]) \(currentYear)"
        if( currentMonth == 1 && currentYear % 4 == 0)
        {
            daysinMonth[currentMonth] = 29
        }
        q = 31 - daysinMonth[currentMonth]
        while(q != 0)
        {
            dateArray2.removeLast()
            q=q-1
        }
        
        
        var dateComponents = DateComponents()
        dateComponents.year = currentYear
        dateComponents.month = currentMonth + 1
        dateComponents.day = 1

        
        
        var date = Calendar.current.date(from: dateComponents)!
        var calendar = Calendar.current
        var components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        while(dayOfWeek != 0)
        {
            new_arr.append(contentsOf: blank_arr)
            dayOfWeek -= 1
            
        }
        new_arr.append(contentsOf: dateArray2)
        

    
        
        

            
        
        //   self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil ) , forCellWithReuseIdentifier: "ItemCell")
        
     }
    
    func  Left_Button()
    {
        new_arr = []
        dateArray2 = dateArray
        currentMonth -= 1
        if(currentMonth < 0)
        {
            currentYear -= 1
            currentMonth = 11
        }


        MonthLbl.text = "\(Month[currentMonth]) \(currentYear)"
        if( currentMonth == 1 && currentYear % 4 == 0)
        {
            daysinMonth[currentMonth] = 29
        }
        q = 31 - daysinMonth[currentMonth]
        while(q != 0)
        {
            dateArray2.removeLast()
            q = q - 1
        }
        var dateComponents = DateComponents()
        dateComponents.year = currentYear
        dateComponents.month = currentMonth + 1
        dateComponents.day = 1

        
        
        var date = Calendar.current.date(from: dateComponents)!
        var calendar = Calendar.current
        var components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        
        while(dayOfWeek != 0)
        {
            new_arr.append(contentsOf: blank_arr)
            dayOfWeek -= 1
            
        }
        new_arr.append(contentsOf: dateArray2)
        
        collectionView.reloadData()

    }
    
    
    func Right_Button()
    {
        new_arr = []
    dateArray2 = dateArray
    currentMonth += 1
    if(currentMonth > 11)
    {
        currentYear+=1
        currentMonth=0
    }
        MonthLbl.text = "\(Month[currentMonth]) \(currentYear)"
        if( currentMonth == 1 && currentYear % 4 == 0)
        {
            daysinMonth[currentMonth] = 29
        }
        q = 31 - daysinMonth[currentMonth]
        while(q != 0)
        {
            dateArray2.removeLast()
            q = q-1
        }
        var dateComponents = DateComponents()
        dateComponents.year = currentYear
        dateComponents.month = currentMonth + 1
        dateComponents.day = 1

        
        
        var date = Calendar.current.date(from: dateComponents)!
        var calendar = Calendar.current
        var components = calendar.dateComponents([.weekday], from: date)
        var dayOfWeek = components.weekday! - 1
        
        
        while(dayOfWeek != 0)
        {
            new_arr.append(contentsOf: blank_arr)
            dayOfWeek -= 1
        }
        new_arr.append(contentsOf: dateArray2)
        
        
        collectionView.reloadData()
        }
    
    
    
    @IBOutlet weak var MonthLbl: UILabel!
    
    @IBAction func Left_button(_ sender: Any) {
        Left_Button()
    }
    
    
    @IBAction func swipeleft(_ sender: UISwipeGestureRecognizer) {
        Right_Button()
    }
    
    
    @IBAction func swiperight(_ sender: UISwipeGestureRecognizer) {
        Left_Button()
    }
    
    @IBAction func Right_button(_ sender: Any) {
        Right_Button()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
     return self.new_arr.count
     }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
         cell.setData(text: self.new_arr[indexPath.row])
         return cell
         
    }
    
    
    
    @IBOutlet weak var weekday_stack: UIStackView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}








