//
//  DummyData.swift
//  tableView-tutorial
//
//  Created by dhui on 2023/07/21.
//

import Foundation

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
        self.title = "타이틀: \(uuid)"
        self.body = "바디: \(uuid)"
    }
    
    // static이라 메모리에 올리지 않고도 사용 가능.
    static func getDummies(_ count: Int = 100) -> [DummyData] {
        return (1...count).map{ _ in DummyData() }
    }
}
