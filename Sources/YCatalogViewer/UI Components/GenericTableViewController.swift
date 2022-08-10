//
//  GenericTableViewController.swift
//
//  Created by Y Media Labs on 08/08/22.
//

import UIKit

/// genericTableViewController that can display `Populatable` and `Reusable` view
final public class GenericTableViewController<View: ContentView>: UITableViewController {
    private typealias GenericCell = GenericTableViewCell<View>
    
    private var models: [View.Model]
    
    public init(navigationTitle: String? = nil, models: [View.Model]) {
        self.models = models
        super.init(nibName: nil, bundle: nil)
        self.tableView.register(GenericCell.self, forCellReuseIdentifier: GenericCell.identifier)
        self.navigationItem.title = navigationTitle
    }
    
    required init?(coder: NSCoder) { nil }
    
    /// :nodoc:
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    /// :nodoc:
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericCell.identifier, for: indexPath) as? GenericCell
        cell?.selectionStyle = View.self is Selectable ? .default : .none
        cell?.populate(with: models[indexPath.row])
        return cell ?? GenericCell()
    }
    
    /// :nodoc:
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
