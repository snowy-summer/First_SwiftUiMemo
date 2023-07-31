//
//  DetailView.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer = false
    var body: some View {
        NavigationView
        {
            VStack
            {
                ScrollView
                {
                    VStack
                    {
                        HStack
                        {
                            Text(memo.content)
                                .padding()
                            Spacer(minLength: 0)
                        }
                        
                        Text(memo.insertDate, style: .date)
                            .padding()
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            .navigationTitle("메모 보기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                ToolbarItemGroup(placement: .bottomBar)
                {
                    Button
                    {
                        showComposer = true
                    }
                label:
                    {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            
            .sheet(isPresented: $showComposer)
            {
                ComposeView(memo: memo)
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
