//
//  Model.swift
//  CustomCellTableExample
//

import Foundation

enum FuelType {
    case electric
    case petrol
    case hybrid
}

extension FuelType {
    var imageName: String {
        switch self {
        case .electric:
            "battery.100percent.circle"
        case .hybrid:
            "swirl.circle.righthalf.filled"
        case .petrol:
            "fuelpump.circle"
        }
    }
}

struct Vehicle {
    var name: String
    var image: String
    var brand: String
    var fuelType: FuelType
    var site: String
}

let data =  [
    Vehicle(name: "718 Boxster", image: "porche-718-boxster", brand: "Porche", fuelType: .petrol, site: "https://www.porsche.com/korea/ko/models/718/718-models/718-boxster-gts-4/"),
    Vehicle(name: "911 Carrera", image: "porche-911-carrera", brand: "Porche", fuelType: .petrol, site: "https://www.porsche.com/korea/ko/models/911/911-models/carrera/"),
    Vehicle(name: "Taycan", image: "porche-taycan", brand: "Porche", fuelType: .electric, site: "https://www.porsche.com/korea/ko/models/taycan/taycan-models/taycan/"),
    Vehicle(name: "Panamera", image: "porche-panamera", brand: "Porche", fuelType: .hybrid, site: "https://www.porsche.com/korea/ko/models/panamera/panamera-models/panamera-4/"),
    Vehicle(name: "macan", image: "porche-macan", brand: "Porche", fuelType: .petrol, site: "https://www.porsche.com/korea/ko/models/macan/macan-models/macan-s/"),
    Vehicle(name: "Cayenne", image: "porche-cayenne", brand: "Porche", fuelType: .hybrid, site: "https://www.porsche.com/korea/ko/models/cayenne/cayenne-models/"),
    
    Vehicle(name: "model 3", image: "tesla-model-3", brand: "Tesla", fuelType: .electric, site: "https://www.tesla.com/ko_kr/model3"),
    Vehicle(name: "model S", image: "tesla-model-s", brand: "Tesla", fuelType: .electric, site: "https://www.tesla.com/ko_kr/models/design"),
    Vehicle(name: "model X", image: "tesla-model-x", brand: "Tesla", fuelType: .electric, site: "https://www.tesla.com/ko_kr/modelx"),
]
