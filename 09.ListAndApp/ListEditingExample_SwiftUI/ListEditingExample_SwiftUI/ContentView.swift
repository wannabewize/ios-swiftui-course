//
//  ContentView.swift
//  ListEditingExample_SwiftUI
//
//  Created by wannabewize on 10/21/23.
//

import SwiftUI




struct ContentView: View {
    let origin = ["a", "b", "c", "d", "e", "f", "g", "h"]
    @State var data = ["a", "b", "c", "d", "e", "f", "g", "h"]
    
    @State var isShowingAddDialog = false
    @State var newItemInput: String = ""
    
    @State var selected = Set<String>()
    @State var selectMode = false
    @State var listEditMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            VStack {
                
                List(selection: $selected) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .moveDisabled(selectMode)
                    }
                    .onDelete(perform: { indexSet in
                        data.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        data.move(fromOffsets: indices, toOffset: newOffset)
                        print("after move :", data)
                    })
                    .deleteDisabled(selectMode)
                }
                .selectionDisabled(!selectMode)
                .moveDisabled(selectMode)
                .deleteDisabled(!selectMode)
                .listStyle(.plain)
                // Pull to Refresh : 처음 상태(데이터로 되돌리기)
                .refreshable {
                    data = origin
                }
                
            }
            .padding()
            // 툴바는 NavigationView와 함께 사용해야 함.
            .toolbar {
                
                Button {
                    isShowingAddDialog = true
                } label: {
                    Text("Add")
                }
                
                // https://developer.apple.com/documentation/swiftui/editbutton
                EditButton()
                
                Button {
                    selectMode.toggle()
                    
                    listEditMode = listEditMode.isEditing ? .inactive : .active
                } label: {
                    Text("Select")
                }
            }
            .alert("추가하기", isPresented: $isShowingAddDialog, actions: {
                
                TextField("추가하기", text: $newItemInput)
                
                Button("취소", role: .cancel) {
                    // 취소 동작
                }
                Button("확인") {
                    if newItemInput.count > 0 {
                        self.data.append(newItemInput)
                        newItemInput = ""
                    }
                    isShowingAddDialog = false
                }
            })
            // EditButton으로 편집 모드 상태를 listEditMode이름의 State에 바인딩
            .environment(\.editMode, $listEditMode)
            // listEditMode State 변경 이벤트
            .onChange(of: listEditMode) { oldValue, newValue in
                print("edit mode changed :", newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
