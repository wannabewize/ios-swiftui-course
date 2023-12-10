//
//  ContentView.swift
//  NaturalLanguageExample
//

import SwiftUI
import NaturalLanguage

struct ContentView: View {
    @State var userInput: String = "It's pretty cool."
    @State var languageResults: [String] = []
    @State var sentimentResults: [String] = []
    @State var lemmaResults: [String] = []
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button("샘플1") {
                    userInput = """
                    건물 사이에 피어난 장미
                    제발 살아남아 줬으면
                    꺾이지 마 잘 자라줘
                    
                    온몸을 덮고 있는 가시
                    얼마나 힘이 들었으면
                    견뎌내줘서 고마워
                    """
                }
                
                Button("샘플2") {
                    userInput = """
                    거센 바람이 불어와
                    내 살을 베려 해도
                    자꾸 벌레들이 나를
                    괴롭히고 파고들어도
                    
                    No 언제나 굴하지 않고
                    쓰러지지 않아 난
                    어렵게 나왔잖아
                    악착같이 살잖아
                    """
                }
                
                Button("샘플3") {
                    userInput = """
                    Keep it up
                    Oh oh oh oh
                    
                    No I'm not goin' down I'll be alright
                    Yeh I'm only goin' up and Imma be alright
                    """
                }
            }
            
            TextEditor(text: $userInput)
                .frame(height: 160)
                .padding()
                .border(.gray, width: 0.5)
            
            
            Button("Do It") {
                languageResults = []
                sentimentResults = []
                
                let tagger = NLTagger(tagSchemes: [.sentimentScore, .language, .lemma])
                tagger.string = userInput
                
                tagger.enumerateTags(in: userInput.startIndex..<userInput.endIndex, unit: .paragraph, scheme: .language) { tag, range in
                    
                    guard let tag = tag else { return false }
                        
                    let low = range.lowerBound.utf16Offset(in: userInput)
                    let upper = range.upperBound.utf16Offset(in: userInput)
//                        print("언어는? :", tag, range, low, upper)
                    languageResults.append("\(low)-\(upper) : \(tag.rawValue)")

                    return true
                }
                
                tagger.enumerateTags(in: userInput.startIndex..<userInput.endIndex, unit: .paragraph, scheme: .sentimentScore) { tag, range in
                    
                    guard let tag = tag else { return false }
                    
                    print("긍정? :", tag, range)
                    let low = range.lowerBound.utf16Offset(in: userInput)
                    let upper = range.upperBound.utf16Offset(in: userInput)

                    sentimentResults.append("\(low)-\(upper) : \(tag.rawValue)")
                    return true
                }
                
                tagger.enumerateTags(in: userInput.startIndex..<userInput.endIndex, unit: .paragraph, scheme: .lemma) { tag, range in
                    guard let tag = tag else { return false }
                    
                    let low = range.lowerBound.utf16Offset(in: userInput)
                    let upper = range.upperBound.utf16Offset(in: userInput)

                    lemmaResults.append("\(low)-\(upper) : \(tag.rawValue)")
                    return true
                }
            }
            
            Text("언어 식별")
                .font(.headline)
            Text(languageResults.joined(separator: "\n"))
            
            Text("정서(긍정/부정)")
                .font(.headline)
            Text(sentimentResults.joined(separator: "\n"))

            Text("형태소")
                .font(.headline)
            Text(lemmaResults.joined(separator: "\n"))
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
