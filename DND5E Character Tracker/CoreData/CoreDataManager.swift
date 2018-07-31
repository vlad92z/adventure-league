import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()

    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "DND5E Character Tracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch(_ request: NSFetchRequest<NSFetchRequestResult>) -> [NSManagedObject] {
        do {
            let anyResult = try persistentContainer.viewContext.fetch(request)
            guard let result = anyResult as? [NSManagedObject] else {
                print("The fetch result did not return [NSMAnagedObject]")
                return []
            }
            return result
        } catch {
            print("Could not fetch data: \(error.localizedDescription)")
            return []
        }
    }
    
    func delete(_ objects: [NSManagedObject]) {
        let context = persistentContainer.viewContext
        for object in objects {
            context.delete(object)
        }
        do {
            try context.save()
        } catch {
            print("Could save context after deleting: \(error.localizedDescription)")
        }
    }
    
    func createObject(for entityName: String) -> NSManagedObject? {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            print("Could not create entity with name \(entityName)")
            return nil
        }
        let object = NSManagedObject(entity: entity, insertInto: context)
        return object
    }
}
