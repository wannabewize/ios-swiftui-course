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

struct Vehicle: Identifiable, Hashable {
    var id = UUID()
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

enum Brand {
    case porsche
    case tesla
}

struct Showroom: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let brand: Brand
    let latitude: Double
    let longitude: Double
}

let showrooms = [
    Showroom(name: "포르쉐 센터 강남", brand: .porsche, latitude: 37.502558, longitude: 127.037289),
    Showroom(name: "포르쉐 센터 서울", brand: .porsche, latitude: 37.514244, longitude: 127.062718),
    Showroom(name: "포르쉐 센터 북서울", brand: .porsche, latitude: 37.657148, longitude: 127.031543),
    Showroom(name: "포르쉐 센터 강북", brand: .porsche, latitude: 37.639566, longitude: 127.026700),
    Showroom(name: "포르쉐 센터 인천", brand: .porsche, latitude: 37.400640, longitude: 126.659969),
    Showroom(name: "포르쉐 센터 대구", brand: .porsche, latitude: 35.866859, longitude: 128.633137),
    Showroom(name: "포르쉐 센터 부산", brand: .porsche, latitude: 35.163836, longitude: 129.051850),
    Showroom(name: "포르쉐 센터 광주", brand: .porsche, latitude: 35.145474, longitude: 126.885455),
    Showroom(name: "포르쉐 센터 울산", brand: .porsche, latitude: 35.558098, longitude: 129.256290),
    Showroom(name: "포르쉐 센터 대전", brand: .porsche, latitude: 36.356558, longitude: 127.391772),
    Showroom(name: "포르쉐 센터 센텀시티", brand: .porsche, latitude: 35.186139, longitude: 129.131995),
    Showroom(name: "포르쉐 센터 전주", brand: .porsche, latitude: 35.806206, longitude: 127.090468),
    Showroom(name: "포르쉐 센터 제주", brand: .porsche, latitude: 33.496619, longitude: 126.493841),
    Showroom(name: "테슬라 서울", brand: .tesla, latitude: 37.514244, longitude: 127.062718),
    Showroom(name: "테슬라 강남", brand: .tesla, latitude: 37.502558, longitude: 127.037289),
    Showroom(name: "테슬라 북서울", brand: .tesla, latitude: 37.657148, longitude: 127.031543),
    Showroom(name: "테슬라 대구", brand: .tesla, latitude: 35.866859, longitude: 128.633137),
    Showroom(name: "테슬라 부산", brand: .tesla, latitude: 35.163836, longitude: 129.051850),
    Showroom(name: "테슬라 광주", brand: .tesla, latitude: 35.145474, longitude: 126.885455),
    Showroom(name: "테슬라 울산", brand: .tesla, latitude: 35.558098, longitude: 129.256290),
    Showroom(name: "테슬라 대전", brand: .tesla, latitude: 36.356558, longitude: 127.391772),
    Showroom(name: "테슬라 센텀시티", brand: .tesla, latitude: 35.186139, longitude: 129.131995),
    Showroom(name: "테슬라 전주", brand: .tesla, latitude: 35.806206, longitude: 127.090468),
    Showroom(name: "테슬라 제주", brand: .tesla, latitude: 33.496619, longitude: 126.493841),
]
