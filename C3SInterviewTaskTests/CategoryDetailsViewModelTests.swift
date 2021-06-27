//
//  C3SInterviewTaskTests.swift
//  C3SInterviewTaskTests
//
//  Created by Ibrahim on 27/06/2021.
//

import XCTest
@testable import C3SInterviewTask

class C3SInterviewTaskTests: XCTestCase {
    
    var viewModel:CategoryDetailsViewModel!
    var cars:[Car] = []
    override  func setUp() {
        let carCategory = CarCategory(name: "car1", imageName: "", description: "")
        viewModel = CategoryDetailsViewModel(carCategory:carCategory )
        
        cars = [
            Car(carCompany: "A", logo: "", carModel: "", style: "car1", year: "", price: "", carImg: "", isAvailable: true),
            Car(carCompany: "B", logo: "", carModel: "", style: "car2", year: "", price: "", carImg: "", isAvailable: true),
            Car(carCompany: "C", logo: "", carModel: "", style: "car3", year: "", price: "", carImg: "", isAvailable: true),
            Car(carCompany: "A", logo: "", carModel: "", style: "car1", year: "", price: "", carImg: "", isAvailable: true)
        ]
        
    }
    
    func testFilterItemCount(){
        viewModel.filterCars(allCars: cars)
        XCTAssertEqual(viewModel.cars.count, 2)
    }
    
    func testFilterItemStyle(){
        for item in viewModel.cars {
            
            if item.style != viewModel.categoryName{
                XCTFail("testFilterItemStyle: Wronge filter style")
            }
        }
        
    }
    
    
    func testGetCarsCollectionViewModelCount(){
        let vm = viewModel.getCarsCollectionViewModel()
        XCTAssertEqual(viewModel.cars.count, vm.carsCellViewModel.count)
    }
    func testgroupCarsByCompanyNameArrCount(){
        viewModel.cars = cars
        
        let groupedArr = viewModel.groupCarsByCompanyName()
        
        XCTAssertEqual(groupedArr.count, 3)
        
    }
    
    
 }
