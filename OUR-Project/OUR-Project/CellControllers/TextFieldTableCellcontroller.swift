//
//  TextFieldTableCellcontroller.swift
//  OUR-Project
//
//  Created by t2023-m0059 on 2023/08/14.
//

import Foundation
import UIKit

class TextFieldTableCellcontroller: TableCellController {
    
    fileprivate let item: ListItem
    
    init(item: ListItem) {
        self.item = item
    }
    
    fileprivate static var cellIdentifier: String {
        return String(describing: type(of: TextFieldTableCellcontroller.self))
    }
    
    static func registerCell(on tableView: UITableView) {
        tableView.register(UINib(nibName: cellIdentifier, bundle: Bundle(for: TextFieldTableCellcontroller.self)), forCellReuseIdentifier: cellIdentifier)
    }
    
    func cellFromTableView(_ tableView: UITableView, forIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).cellIdentifier, for: indexPath) as! TextFieldTableCellcontroller
        
        // Configure photo cell...
        
        return cell
    }
    
    func didSelectCell() {
        // Do something for photo...
    }
}
