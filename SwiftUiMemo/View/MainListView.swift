//
//  MainListView.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
   
    var body: some View {
        NavigationView{
            List {
                ForEach(store.list)
                {
                    memo in
                    NavigationLink
                    {
                        DetailView(memo: memo)
                        
                    }
                    label:
                    {
                        MemoCell(memo: memo)
                    }
                    
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)// 라운드진걸 없애줌
            .navigationTitle("내 메모")
            .toolbar
            {
                Button
                {
                    showComposer = true
                }
            label:
                {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $showComposer)
            {
                ComposeView()
            }// showComposer가 true가 되면 composeView를 실행
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

