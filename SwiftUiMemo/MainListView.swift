//
//  MainListView.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
   // @EnvironmentObject
    var body: some View {
        NavigationView{
            List(store.list)
            {
                memo in VStack(alignment: .leading) {
                    Text(memo.content)
                        .font(.body)
                        .lineLimit(1)
                    
                    Text(memo.insertDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
        }
            .listStyle(.plain)// 라운드진걸 없애줌
            .navigationTitle("내 메모")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
