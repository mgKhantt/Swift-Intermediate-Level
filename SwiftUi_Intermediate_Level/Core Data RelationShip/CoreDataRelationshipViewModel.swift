//
//  CoreDataRelationshipViewModel.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 07/08/2025.
//

import Foundation
import CoreData

class CoreDataRelationshipViewModel: ObservableObject {
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    let coreDataManager = CoreDataManager.instance
    
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: coreDataManager.context)
        newBusiness.name = "Apple"
        
        save()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            businesses = try coreDataManager.container.viewContext.fetch(request)
        } catch let error {
            print("Business entity error: \(error)")
        }
        
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: coreDataManager.context)
        newDepartment.name = "Marketing"
        newDepartment.businesses = [businesses[0]]
        
        save()
        
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try coreDataManager.context.fetch(request)
        } catch let error {
            print("Department entity error: \(error)")
        }
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: coreDataManager.context)
        newEmployee.name = "Khant"
        newEmployee.dateJoined = Date()
        newEmployee.age = 20
        
        newEmployee.business = businesses[0]
        newEmployee.department = departments[0]
        
        save()
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try coreDataManager.context.fetch(request)
        } catch let error {
            print("Employee entity error: \(error)")
        }
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.coreDataManager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}
