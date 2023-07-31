//
//  Memo.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject
{
    // Identifiable:  데이터를 리스트에 쉽게 바인딩하기위해 필요, id로 구분한다.
    // ObservableObject: 메모를 편집할때 뷰를 자동으로 업데이트 하기위해 필요하다.
    
    let id: UUID
    //UUID 중복을 방지한다. Universally Unique IDentifier
    @Published var content: String
    
    //UI가 자동으로 업데이트됨
    
    let insertDate: Date
    //날짜 추가
    
    
    init(content: String, insertDate: Date = Date.now)
    {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
        //각각 전달받은 값을 content와 insertDate에 저장
    }
    
}
