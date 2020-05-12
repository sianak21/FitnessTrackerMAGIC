//
//  ViewController.swift
//  Fitness Tracker (Final)
//
//  Created by Siana Kapoor on 3/30/20.
//  Copyright © 2020 Siana Kapoor. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    let health = HKHealthStore()
    var shownWarning : Bool = false
    
    @IBOutlet weak var heartRate: UILabel!
    @IBOutlet weak var milesWalked: UILabel!
    @IBOutlet weak var stepCount: UILabel!
    
    //for heart rate
    func getHeartRateDataPermission(){
        let heartRateType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!

        HKHealthStore().requestAuthorization(toShare: nil, read: [heartRateType]) {(success, error) in
            print(success)
    //Success will always be equal to true unless a genuine error occurs
        }
    }
    func getheartRateData(){
        let heartRateType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
        let startDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortDescriptors = [
            NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
        ]

        let heartRateQuery = HKSampleQuery(sampleType: heartRateType,
                                           predicate: predicate,
                                           limit: HKObjectQueryNoLimit,
                                           sortDescriptors: sortDescriptors)
        { (query:HKSampleQuery, results:[HKSample]?, error:Error?) -> Void in
                guard let results = results else { return }
                if results.count == 0 && !self.shownWarning { //if there is no results
                    self.shownWarning = true
                    DispatchQueue.main.async {
                        self.showNilError()
                    }
                }
                else{
                    /*let heartRateUnit:HKUnit = HKUnit(from: "count/min")
                    self.heartRate.text = (results[0] as? HKQuantitySample)?.quantity.doubleValue(for: heartRateUnit) as? String*/
                }
        }
        health.execute(heartRateQuery)
    }
    
    //for miles walked
    func getMilesWalkedDataPermission(){
        let milesWalkedType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!

        HKHealthStore().requestAuthorization(toShare: nil, read: [milesWalkedType]) {(success, error) in
                print(success)
        //Success will always be equal to true unless a genuine error occurs
        }
    }
    func getMilesWalkedData(){
        let milesWalkedType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
        let startDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortDescriptors = [
            NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
        ]

        let milesWalkedQuery = HKSampleQuery(sampleType: milesWalkedType,
                                            predicate: predicate,
                                            limit: HKObjectQueryNoLimit,
                                            sortDescriptors: sortDescriptors)
        { (query:HKSampleQuery, results:[HKSample]?, error:Error?) -> Void in
                guard let results = results else { return }
                if results.count == 0 && !self.shownWarning { //if there is no results
                    self.shownWarning = true
                    DispatchQueue.main.async {
                        self.showNilError()
                    }
                }
                else{
                    self.milesWalked.text = "Heart Rate"
                }
        }
        health.execute(milesWalkedQuery)
    }
   
    //for steps count
    let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
    func getStepCountDataPermission(){
        let stepCountType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!

        HKHealthStore().requestAuthorization(toShare: nil, read: [stepCountType]) {(success, error) in
                print(success)
        //Success will always be equal to true unless a genuine error occurs
        }
    }
    func getStepCountData(){
        let stepCountType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let startDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortDescriptors = [
            NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)
        ]

        let stepCountQuery = HKSampleQuery(sampleType: stepCountType,
                                            predicate: predicate,
                                            limit: HKObjectQueryNoLimit,
                                            sortDescriptors: sortDescriptors)
        { (query:HKSampleQuery, results:[HKSample]?, error:Error?) -> Void in
                guard let results = results else { return }
                if results.count == 0 && !self.shownWarning { //if there is no results
                    self.shownWarning = true
                    DispatchQueue.main.async {
                        self.showNilError()
                    }
                }
                else{
                    self.stepCount.text = "Heart Rate"
                }
        }
        health.execute(stepCountQuery)
    }
    func showNilError() {
        let alert = UIAlertController(title: "No Heart Rate Data Found", message: "There was no heart rate data found for the selected dates. If you expected to see data, it may be that ARTRate is not authorised to read you heart rate data. Please go to the settings app (Privacy -> HealthKit) to change this.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Go to settings", style: .default, handler:  { action in
            if let url = URL(string:UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }            }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let imageURL = URL(string: "https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage(with: imageURL)
    }
    func downloadImage(with url: URL){
        spinner(shouldSpin: true)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
                self.spinner(shouldSpin: false)
            }
        }.resume()
    }
    func spinner(shouldSpin status: Bool){
        if status == true {
            spinner.isHidden = false
            spinner.startAnimating()
        } else {
            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }
}
