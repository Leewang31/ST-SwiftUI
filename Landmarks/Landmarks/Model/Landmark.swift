import Foundation // Codable 프로토콜을 사용하여 JSON 데이터를 처리하기 위해 필요합니다.
import SwiftUI // SwiftUI의 Image 타입을 사용하기 위해 필요합니다.
import CoreLocation // CoreLocation 프레임워크를 가져와 위치 데이터를 처리할 수 있도록 합니다. SwiftUI에서 MapKit과 함께 좌표 데이터를 활용할 때 필요합니다.

/**
 * struct Landmark → Landmark는 구조체로 정의됨.
 * Hashable → Swift의 컬렉션(Set, Dictionary)에서 활용할 수 있도록 해시 가능하게 설정.
 * Codable → JSON 데이터를 쉽게 인코딩/디코딩할 수 있도록 지원. (Encodable + Decodable)*
 */

/**
 * Identifiable은 Swift의 프로토콜로,
 * Identifiable을 준수하면 SwiftUI가 데이터 항목을 자동으로 구분하고 관리할 수 있습니다.
 */
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int // Identifiable을 준수하려면 반드시 'id' 속성이 필요함
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool // 좋아요 여부
    var isFeatured: Bool

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    private var imageName: String
    // SwiftUI의 Image 객체를 생성할 수 있음.
    var image: Image {
        Image(imageName)
    }

    /**
     * coordinates 속성을 기반으로 CLLocationCoordinate2D 객체를 생성하는 계산된 속성입니다.
     * CLLocationCoordinate2D는 CoreLocation에서 사용되는 좌표 타입으로, MapKit과 같은 프레임워크에서 활용됩니다.
     * locationCoordinate를 사용하면 SwiftUI의 Map 뷰에서 지도 중심 좌표로 설정 가능합니다.
     */
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    /**
     * 위도(latitude)와 경도(longitude)를 저장하는 구조체입니다.
     * Hashable을 채택하여 Set 또는 Dictionary에서 활용 가능.
     * Codable을 채택하여 JSON 데이터 변환 가능.
     */
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
