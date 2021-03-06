//
//  ColumnTableViewCell.swift
//  ColumnTableView
//
//  Created by Jorge Luis on 03/08/17.
//  Copyright © 2017 Jorge Luis. All rights reserved.
//

import UIKit

public protocol ColumnsViewProtocol: class {
    func hideColumns(_ columns: [Int])
    func showColumns(_ columns: [Int])
}

open class ColumnsTableViewCell: UITableViewCell, ColumnsViewContainerControllerDelegate, ColumnsViewProtocol {
    open let containerView: ColumnsViewContainer = ColumnsViewContainer()
    
    private lazy var containerConstraintsToActivateOnSetup: [NSLayoutConstraint] = {
        return self.createContainerConstraintsToActivateOnSetup()
    }()
        
    open var columnsFields: [ColumnFieldContent] {
        return []
    }
    
    open func hideColumns(_ columns: [Int]){
        self.containerView.hideColumns(columns)
    }
    
    open func showColumns(_ columns: [Int]){
        self.containerView.showColumns(columns)
    }
    
    open func setupViews(){
        self.containerView.delegate = self
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.setContainerConstraintsIfNeeded()
    }
    
    private func setContainerConstraintsIfNeeded(){
        let needsSetConstraints = self.reuseIdentifier != nil
        
        if needsSetConstraints{
            self.contentView.addSubview(self.containerView)
            
            NSLayoutConstraint.activateIfNotActive(self.containerConstraintsToActivateOnSetup)
        }
    }
    
    open func createContainerConstraintsToActivateOnSetup() -> [NSLayoutConstraint] {
        var containerConstraints: [NSLayoutConstraint] = []
        containerConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[container]|", metrics: nil, views: ["container":self.containerView]))
        containerConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[container]|", metrics: nil, views: ["container":self.containerView]))
        return containerConstraints
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupViews()
    }
}
