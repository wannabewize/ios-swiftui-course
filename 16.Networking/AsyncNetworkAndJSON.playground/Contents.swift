/**
 * 비동기 네트워크로 JSON  다루기
 * 서버 : httpbin.org 의 JSON 응답
 */
import Foundation

// 응답 JSON 구조
/*
 {
   "slideshow": {
     "author": "Yours Truly",
     "date": "date of publication",
     "slides": [
       {
         "title": "Wake up to WonderWidgets!",
         "type": "all"
       },
       {
         "items": [
           "Why <em>WonderWidgets</em> are great",
           "Who <em>buys</em> WonderWidgets"
         ],
         "title": "Overview",
         "type": "all"
       }
     ],
     "title": "Sample Slide Show"
   }
 }
*/
struct Slide: Codable {
    let title: String
    let type: String
    let items: [String]?
}

struct SlideShow: Codable {
    let title: String
    let author: String
    let date: String
    let slides: [Slide]
}

struct ResponseWrapper: Codable {
    let slideshow: SlideShow
}

func fetchSlides(completionHandler: @escaping (SlideShow?, Error?) -> Void) {
    let url = URL(string: "https://httpbin.org/json")!
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            completionHandler(nil, error)
            return
        }
        
        let decoded = try! JSONDecoder().decode(ResponseWrapper.self, from: data!)
        completionHandler(decoded.slideshow, nil)
    }.resume()
}

fetchSlides { slideShow, error in
    guard error == nil else {
        print("error :", error!)
        return
    }
    print("fetch slideshow successfully")
    print("title:", slideShow!.title)
}

print("== END ==")

