//
//  Helpers.swift
//  ColumnTableView
//
//  Created by Jorge Luis on 04/08/17.
//  Copyright © 2017 Jorge Luis. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutConstraint {
    public class func activateIfNotActive(_ constraints: [NSLayoutConstraint]){
        let notActive = constraints.filter({!$0.isActive})
        self.activate(notActive)
    }
}


public extension UITableViewCell{
    public weak var tableView: UITableView? {
        var view: UIView? = self
        repeat {
            view = view?.superview
            if let table = view as? UITableView { return table }
        } while view?.superview != nil
        return view as? UITableView
    }
}
