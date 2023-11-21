//
//  ListAndFilterView.swift
//  Trigger
//
//  Created by wannabewize on 11/21/23.
//

import SwiftUI

struct ListAndFilterView: View {
    @State var originData = ["a", "ab", "abc", "abcd", "abcde", "abcdef", "abcdefg", "abcdefgh", "abcdefghi", "abcdefghij", "abcdefghijk", "abcdefghijkl"]
    
    @State var filtered: [String] = []
    @State var keyword: String = ""
    
    var body: some View {
        VStack {
            TextField("search keyword", text: $keyword)
                .onSubmit {
                    if filtered.count == 0 {
                        originData.append(keyword)
                        keyword = ""
                    }
                }
            
            if filtered.count > 0 {
                List(filtered, id: \.self) { item in
                    Text(item)
                }
                .listStyle(.plain)
            }
            else {
                Text("Nothing")
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            filtered = originData
        }
        .onChange(of: keyword) { oldValue, newValue in
            print("keyword changed \(oldValue) -> \(newValue)")
            filtered = keyword.count == 0 ? originData
                : originData.filter({ item in
                    item.contains(keyword.trimmingCharacters(in: .whitespaces))
                })
        }
    }
}

#Preview {
    ListAndFilterView()
}
