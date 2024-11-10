//
//  ContentView.swift
//  Modal
//

import SwiftUI


struct PopoverModel: Identifiable {
    var id: String { message }
    let message: String
}

struct ContentView: View {
    @State var data = "Hello"
    @State var isSheetVisible = false
    
    @State var isDetentSheetVisible = false
    @State var detent: PresentationDetent = .medium
    
    @State var isFullScreenCoverVisible = false
    
    @State var isPopoverVisible = false
    @State var isPopover2Visible = false
    
    
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
                            .height(120),
                            .medium,
                            .large,
                        ], selection: $detent)
                        .presentationDragIndicator(.visible)
                        
                }
                
                
                Divider()
                Text("FullScreen Cover")
                    .font(.headline)
                
                Text("macOS 지원 안함")
#if os(iOS)
                Button("FullScreen Cover") {
                    isFullScreenCoverVisible = true
                }
                .fullScreenCover(isPresented: $isFullScreenCoverVisible, content: {
                    ModalView(data: data)
                })
#endif
                
                
                Divider()
                Text("Popover").font(.headline)
                Text("아이폰에서는 sheet로 동작.")
                
                Button("Popover1") {
                    isPopoverVisible = true
                }
                .popover(
                    isPresented: $isPopoverVisible,
                    content: {
                        ModalView(data: data)
                            .frame(minWidth: 300)
                    }
                )
                
                Button("Popover2 - Arrow bottom") {
                    isPopover2Visible = true
                }
                .popover(isPresented: $isPopover2Visible, arrowEdge: .bottom, content: {
                    ModalView(data: data)
                        .frame(minWidth: 300)

                })
                
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
