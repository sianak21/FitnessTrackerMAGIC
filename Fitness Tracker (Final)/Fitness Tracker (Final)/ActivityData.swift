//
//  ActivityData.swift
//  Fitness Tracker (Final)
//
//  Created by Siana Kapoor on 4/16/20.
//  Copyright © 2020 Siana Kapoor. All rights reserved.
//

import Foundation
import HealthKit
import UIKit
/*import class UIKit.UIAlertAction
import class UIKit.UIAlertController
import enum UIKit.UIAlertControllerStyle
import class UIKit.UIApplicationOpenSettingsURLString
*/
/*class ActivityData {
    func getHeartRateDataPermission(){
        let heartRateType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!

        HKHealthStore().requestAuthorization(toShare: nil, read: [heartRateType]) {(success, error) in
            print(success)
    //Success will always be equal to true unless a genuine error occurs
}
}
    let health = HKHealthStore()
    let heartRateType:HKQuantityType   = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
    var shownWarning : Bool = false

    func getheartRateData()
    {
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
                if results.count == 0 && !self.shownWarning {
                    self.shownWarning = true
                    DispatchQueue.main.async {
                        self.showNilError()
                }
            }
        }
        health.execute(heartRateQuery)
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
}
*/
