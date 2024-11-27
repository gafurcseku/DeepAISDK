import Foundation
import Alamofire

enum ImageEditEndpoint : NetworkRoutes {
    case colorizer(_ data: Data)
    case backgroundRemover(_ data: Data)
    case headshots(_ data: Data)
    case selfieGenerator(_ data: Data)
    case superResolution(_ data: Data)
    case upscales(_ data: Data)
    case expand(_ data: Data)
    var method: Alamofire.HTTPMethod {
        switch self {
        case .colorizer,.backgroundRemover,.headshots,.selfieGenerator,.superResolution,.upscales,.expand:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .colorizer:
            return baseURL + "colorizer"
        case .backgroundRemover:
            return baseURL + "background-remover"
        case .headshots:
            return baseURL + "ai-headshots"
        case .selfieGenerator:
            return baseURL + "ai-selfie-generator"
        case .superResolution:
            return baseURL + "torch-srgan"
        case .upscales:
            return baseURL + "waifu2x"
        case .expand:
            return baseURL + "zoom-out"
        }
    }
    
    var query: [String : Any] {
        switch self {
        case .colorizer(let data),.backgroundRemover(let data),.headshots(let data),.selfieGenerator(let data),.superResolution(let data), .upscales(let data), .expand(let data):
            return ["data": data]
        }
    }
    
    
}
