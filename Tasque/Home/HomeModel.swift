//
//  HomeModel.swift
//  Tasque
//
//  Created by Ahmad Yasser on 25/01/2022.
//

import Foundation

class HomeModel: NSObject {
    
    let cacher = HomeCacheModel()
    let checkMarker = HomeCheckMarkerModel()
//    @objc var dateModel = DateModel()
    
    @objc dynamic var items = [Item]()
    
    
    override init() {
        super.init()
        items = cacher.loadItems() ?? []
        
    }
    
    func itemPressed(at index: Int) {
        items[index] = checkMarker.toggle(items[index])
    }
    
    func addTask(text: String) {
        let newItem = Item(title: text, done: false, date: Date())
        
        items.insert(newItem, at: 0)
        
        cacher.save(items: items)
    }
}

class HomeCheckMarkerModel {
    func toggle(_ item: Item) -> Item {
        let mutatedItem = item
        mutatedItem.done.toggle()
        return mutatedItem
    }
}

class HomeCacheModel {
    static let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    func save(items: [Item]) {
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: HomeCacheModel.dataFilePath!)
        } catch {
            print("error encoding item array: \(error)")
        }
    }
    
    
    func loadItems() -> [Item]? {
        do {
            let data = try Data(contentsOf: HomeCacheModel.dataFilePath!)
            return try PropertyListDecoder().decode([Item].self, from: data)
        } catch {
            print("error decoding item array: \(error)")
            return nil
        }
    }
}

