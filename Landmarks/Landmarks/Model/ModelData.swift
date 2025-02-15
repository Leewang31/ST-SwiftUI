import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json") // landmarks 배열은 load 함수를 호출하여 "landmarkData.json" 파일의 데이터를 로드한 후, Landmark 배열로 변환

}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    /**
     * Bundle.main.url(forResource:withExtension:)을 사용하여 JSON 파일의 경로를 찾습니다.
     * 파일이 존재하지 않으면 fatalError를 호출하여 앱을 강제로 종료하고, 오류 메시지를 출력합니다.
     */
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    /**
     * 파일에서 JSON 데이터를 읽어 Data 타입으로 변환.
     * 파일을 찾았지만 읽을 수 없는 경우 fatalError를 호출하여 앱 종료.
     */
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    /**
     * JSONDecoder를 사용하여 JSON 데이터를 Decodable을 준수하는 타입(T)으로 변환.
     * 변환이 실패하면 오류 메시지를 출력하고 앱 종료.
     */
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
