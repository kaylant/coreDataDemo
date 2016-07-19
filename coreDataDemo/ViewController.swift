//
//  ViewController.swift
//  coreDataDemo
//
//  Created by Kaylan Smith on 7/18/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create app delegate to refer to
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // create context, a handler for us to access data through
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        // create new user which will allow us to insert a new user into our users entity
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        // set values of attributes for a particular user
        newUser.setValue("Grett", forKey: "username")
        
        newUser.setValue("pizzaForDinner", forKey: "password")
        
        // save data to database
        do {
        
            try context.save()
        
        } catch {
        
            print("There was a problem")
        
        }
        
        // retrieves data from database
        let request = NSFetchRequest(entityName: "Users")
        
        // to see data and its values
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            // check to see if we got results
            
            if results.count > 0 {
            
                // then loop through array of data
                for result in results as! [NSManagedObject] {
                
                    print(result.valueForKey("username")!)
                    print(result.valueForKey("password")!)
                
                }
            
            }
            
        } catch {
            
            print("Fetch failed")
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

