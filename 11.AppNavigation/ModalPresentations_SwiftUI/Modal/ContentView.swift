//
//  ContentView.swift
//  Modal
//

import SwiftUI



struct SheetModel: Identifiable {
    var id = UUID()
    var message: String    
}

struct PopoverModel: Identifiable {
    var id: String { message }
    let message: String
}

struct ContentView: View {
    @State var isSheetVisible = false
    @State var sheetModel: SheetModel?
    
    @State var isFullScreenCoverVisible = false
    
    @State var isPopoverVisible = false
    @State var popover: PopoverModel?
    
    @State var isAlertVisible = false
    
    @State var isConfirmationDialogVisible = false
    
    @State var isFileExporterVisible = false
    
    @State var isInspectorVisible = false
    
    @State var data = "Hello"
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Sheet").font(.headline)
            
            Button("Sheet1") {
                // State로 모달 전달 데이터 설정 후 모달 뷰 출력
                data = "Modal by sheet. Data by state."
                isSheetVisible = true
            }
            .sheet(isPresented: $isSheetVisible) {
                // State를 이용한 데이터 전달
                ModalView(data: data)
            }
            
            Button("Sheet2") {
                // 모달로 전달할 데이터 모델 생성 후 모달 전달. 별도의 State 불필요.
                sheetModel = SheetModel(message: "Modal by sheet. data by model")
            }
            .sheet(item: $sheetModel, onDismiss: {
                print("sheet dismissed")
            }) { model in
                ModalView(data: model.message)
            }
            
            Button("Sheet3 with Detents") {
                isSheetVisible = true
            }
            .sheet(isPresented: $isSheetVisible) {
                ModalView(data: data)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            
            Divider()
            Text("FullScreen Sover")
                .font(.headline)
            
            Text("macOS 지원 안함")
            
            #if os(iOS)
            Button("FullScreen Cover") {
                data = "Model by FullScreenCover"
                isFullScreenCoverVisible = true
            }
            .fullScreenCover(isPresented: $isFullScreenCoverVisible, content: {
                ModalView(data: data)
            })
            #endif

            
            Divider()
            Text("Popover").font(.headline)
            Text("아이폰에서는 sheet로 동작. iPad에서는 항상 top에서만 출력")
            
            Button("Popover1") {
                data = "Modal by popover. Data by state"
                isPopoverVisible = true
            }
            .popover(
                isPresented: $isPopoverVisible,
                content: {
                    ModalView(data: data)
                }
            )
            
            Button("Popover2 - bottom") {
                popover = PopoverModel(message: "Modal by popover. Data by model")
            }
            .popover(item: $popover, arrowEdge: .bottom) { model in
                ModalView(data: model.message)
            }
            
            Divider()
            
            Text("Alert").font(.headline)
            
            Button("Alert1") {
                isAlertVisible = true
            }
            .alert("Alert Title", isPresented: $isAlertVisible) {
                Button("Confirm") {
                    print("Confirm selected")
                }
                Button("Cancel", role: .cancel) {
                    print("Cancel selected")
                }
            }
            
            Button("Confirmation Dialog") {
                isConfirmationDialogVisible = true
            }
            .confirmationDialog("Confirmation Title", isPresented: $isConfirmationDialogVisible, titleVisibility: .visible) {
                Button("OK") {
                    print("Confirmation - ok")
                }
            }
            
            Divider()
            
            Text("File Dialog").font(.headline)
            
            Button("File Exporter") {
                isFileExporterVisible = true
            }
            .fileExporter(isPresented: $isFileExporterVisible, items: ["a", "b", "c"]) { results in
                print("completion")
            }
            
            Button("Inspector") {
                isInspectorVisible = true
            }
            .inspector(isPresented: $isInspectorVisible) {
                Text("Inspector")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
