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
    @State var data = "Hello"
    @State var isSheetVisible = false
    
    @State var isDetentSheetVisible = false
    @State var detent: PresentationDetent = .medium
    @State var sheetModel: SheetModel?
    
    @State var isFullScreenCoverVisible = false
    
    @State var isPopoverVisible = false
    @State var popover: PopoverModel?
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {
                TextField("Modal data", text: $data)
                    .frame(height: 30)
                    .border(.gray, width: 0.7)
                    .multilineTextAlignment(.center)
                
                Text("Sheet").font(.headline)
                
                Button("Sheet") {
                    // State로 모달 전달 데이터 설정 후 모달 뷰 출력
                    isSheetVisible = true
                }
                .sheet(isPresented: $isSheetVisible) {
                    // State를 이용한 데이터 전달
                    ModalView(data: data)
                }
                
                Button("Sheet with Detents") {
                    isDetentSheetVisible = true
                }
                .sheet(isPresented: $isDetentSheetVisible) {
                    ModalView(data: data)
                        .presentationDetents([
                            .medium,
                            .large,
                            .fraction(0.7) // 70%
                        ], selection: $detent)
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
                
                NavigationLink("푸쉬 전환") {
                    ModalView(data: data)
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
