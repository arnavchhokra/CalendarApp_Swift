//
//  Data.swift
//  calender-mylo
//
//  Created by Arnav on 10/02/22.
//

import Foundation
class Data
{
    let Month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var CurrentYear: Int = 2021
    var CurrentMonth: Int = 0
    var FirstWeekDayOfMonth = 0
    let DateArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    var DateArray2 = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    var LastWeekDay: Int = 0
    var BlankArray = [" "]
    var ResultArray = [String]()
    var FirstWeek = Int()
    
    
    
    
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
        
        
        // MonthLbl.text = "\(Month[CurrentMonth]) \(CurrentYear)"
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
        var DateComponents = DateComponents()
        DateComponents.year = CurrentYear
        DateComponents.month = CurrentMonth + 1
        
        
        let Date = Calendar.current.date(from: DateComponents)!
        let Calendar = Calendar.current
        let Components = Calendar.dateComponents([.weekday], from: Date)
        var DayOfWeek = Components.weekday! - 1
        
        
        while(DayOfWeek != 0)
        {
            ResultArray.append(contentsOf: BlankArray)
            DayOfWeek -= 1
        }
        
        ResultArray.append(contentsOf: DateArray2)
        
        //  collectionView.reloadData()
        
    }
    
    
    
    
    func RightButton() {
        ResultArray = []
        DateArray2 = DateArray
        CurrentMonth += 1
        if(CurrentMonth > 11)
        {
            CurrentYear+=1
            CurrentMonth=0
        }
        //  MonthLbl.text = "\(Month[CurrentMonth]) \(CurrentYear)"
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
        // dateComponents.day = 1
        
        
        
        let Date = Calendar.current.date(from: dateComponents)!
        let Calendar = Calendar.current
        let Components = Calendar.dateComponents([.weekday], from: Date)
        var DayOfWeek = Components.weekday! - 1
        
        
        while(DayOfWeek != 0)
        {
            ResultArray.append(contentsOf: BlankArray)
            DayOfWeek -= 1
        }
        ResultArray.append(contentsOf: DateArray2)
        
        
        
        
        // collectionView.reloadData()
    }
    // for i in 0...6{
    //      FirstWeek.append(ResultArray[i])
    //   }
    
}
