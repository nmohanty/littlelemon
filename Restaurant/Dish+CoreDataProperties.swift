//
//  Dish+CoreDataProperties.swift
//  Restaurant
//
//  Created by namrata mohanty on 4/14/24.
//
//

import Foundation
import CoreData


extension Dish {

    /*@nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }*/
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    class func deleteAll(_ context:NSManagedObjectContext) {
        let request = Dish.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request) 
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator else
            { return
            }
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    @NSManaged public var category: String?
    @NSManaged public var descript: String?
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

}

extension Dish : Identifiable {

}
