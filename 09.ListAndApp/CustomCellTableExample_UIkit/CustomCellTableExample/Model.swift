//
//  Model.swift
//  CustomCellTableExample
//
//  Created by wannabewize on 10/28/23.
//

import Foundation

enum FuelType {
    case electric
    case petrol
}

extension FuelType {
    var imageName: String {
        switch self {
        case .electric:
            "battery.100percent.circle"
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
}

let data =  [
    Vehicle(name: "718 boxster", image: "porche-718-boxster", brand: "Porche", fuelType: .petrol),
    Vehicle(name: "911 carrera", image: "porche-911-carrera", brand: "Porche", fuelType: .petrol),
    Vehicle(name: "cayenne", image: "porche-cayenne", brand: "Porche", fuelType: .electric),
    Vehicle(name: "macan", image: "porche-macan", brand: "Porche", fuelType: .petrol),
    Vehicle(name: "model 3", image: "tesla-model-3", brand: "Tesla", fuelType: .electric),
    Vehicle(name: "model S", image: "tesla-model-s", brand: "Tesla", fuelType: .electric),
    Vehicle(name: "model X", image: "tesla-model-x", brand: "Tesla", fuelType: .electric),
]
