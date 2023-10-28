//
//  CarListViewController.swift
//  CustomCellTableExample
//
//  Created by wannabewize on 10/28/23.
//

import UIKit

class VehicleCell: UITableViewCell {
    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fueltypeImageView: UIImageView!
}

class CarListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell", for: indexPath) as? VehicleCell else {
            fatalError("No Cell")
        }
        
        let item = data[indexPath.row]
        
        cell.vehicleImageView.image = UIImage(named: item.image)
        cell.brandLabel.text = item.brand
        cell.nameLabel.text = item.name
        cell.fueltypeImageView.image = UIImage(systemName: item.fuelType.imageName)

        return cell
    }
}
