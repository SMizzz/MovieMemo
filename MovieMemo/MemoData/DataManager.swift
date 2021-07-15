//
//  DataManager.swift
//  MovieMemo
//
//  Created by 신미지 on 2021/07/15.
//

import Foundation
import CoreData

class DataManager {
  static let shared = DataManager()
  private init () {
    
  }
  
  var mainContext: NSManagedObjectContext {
    return persistentContainer.viewContext
  }
  
  var memoData = [Memo]()
  func fetchMemo() {
    let request: NSFetchRequest<Memo> = Memo.fetchRequest()
    let sortByDateDesc = NSSortDescriptor(key: "date", ascending: false)
    request.sortDescriptors = [sortByDateDesc]
    
    do {
      memoData = try mainContext.fetch(request)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func addNewMemp(
    _ title: String,
    _ memo: String,
    _ date: Date
  ) {
    let newMemo = Memo(context: mainContext)
    newMemo.date = date
    newMemo.title = title
    newMemo.memo = memo
    saveContext()
  }
  
  func deletePost(at index: Int) {
    DataManager.shared.memoData.remove(at: index)
    saveContext()
  }
  
  // MARK: - Core Data stack
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Memo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
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
}
