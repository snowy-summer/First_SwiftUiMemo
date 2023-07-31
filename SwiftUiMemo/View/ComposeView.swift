//
//  ComposeView.swift
//  SwiftUiMemo
//
//  Created by 최승범 on 2023/07/31.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                //취소 버튼
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    Button
                    {
                        dismiss()
                    } label:
                    {
                        Text("취소")
                    }
                    
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        store.insert(memo: content)
                        dismiss()
                    } label:
                    {
                        Text("저장")
                    }
                    
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
