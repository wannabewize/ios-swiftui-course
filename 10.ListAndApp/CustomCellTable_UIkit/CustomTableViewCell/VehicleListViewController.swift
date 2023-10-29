//
//  CarListViewController.swift
//  CustomCellTableExample
//

import UIKit


class VehicleListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vehicles"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블 뷰에서 셀 객체 생성.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell", for: indexPath) as? VehicleCell else {
            // 실패시 일반 테이블 뷰 반환
            return UITableViewCell()
        }
        
        let item = data[indexPath.row]
        
        // Asset에 있는 이미지
        cell.vehicleImageView.image = UIImage(named: item.image)
        cell.brandLabel.text = item.brand
        cell.nameLabel.text = item.name
        // SF Symbols 이미지
        cell.fueltypeImageView.image = UIImage(systemName: item.fuelType.imageName)

        return cell
    }    
}
