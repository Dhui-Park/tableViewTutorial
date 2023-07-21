//
//  DummyData.swift
//  tableView-tutorial
//
//  Created by dhui on 2023/07/21.
//

import Foundation
import Fakery

struct DummySection {
    let uuid: UUID
    
    let title: String
    let body: String
    
    let rows: [DummyData]
    
    init() {
        self.uuid = UUID()
        self.title = "섹션 타이틀: \(uuid)"
        self.body = "섹션 바디: \(uuid)"
        self.rows = DummyData.getDummies(10)
    }
    static func getDummies(_ count: Int = 100) -> [DummySection] {
        return (1...count).map{ _ in DummySection() }
    }
}

struct DummyData {
    
    let uuid: UUID
    
    let title: String
    let body: String
    
    init() {
        self.uuid = UUID()
        
        let faker = Faker(locale: "ko")

        let firstName = faker.name.firstName()
        let lastName = faker.name.lastName()
        let body = faker.lorem.paragraphs(amount: 10)
        
        self.title = "타이틀: \(lastName)\(firstName)"
        self.body = "바디: \(body)"
    }
    
    // static이라 메모리에 올리지 않고도 사용 가능.
    static func getDummies(_ count: Int = 100) -> [DummyData] {
        return (1...count).map{ _ in DummyData() }
    }
}
