/**
 * 동기식 코드와 비동기식 코드
 */
import Foundation

let urlStr = "https://files.porsche.com/filestore/galleryimagerwd/multimedia/none/992-tu-gallery-pcn-01/zoom2/7548566b-c1db-11ea-80ca-005056bbdc38;sO/porsche-zoom2.jpg"

func syncTask() {
    print("Start")
    
    let url = URL(string: urlStr)!
    let data = try! Data(contentsOf: url)
    print("Download done:", data.count)
    
    
    print("End")
}

func asyncTask() {
    print("Start")
    
    DispatchQueue.global().async {
        let url = URL(string: urlStr)!
        let data = try! Data(contentsOf: url)
        print("Download done:", data.count)
    }
    
    print("End")
}


//syncTask()
asyncTask()



