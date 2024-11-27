import Foundation
import Alamofire

enum Result {
    case success(ImageResponse)
    case failure(ErrorResponse)
}
typealias CompletionHandler = @Sendable (Result) -> ()
public typealias ErrorResponse = (Int, Data?, Error)


public class APIClient {
    
//    private static var privateShared : APIClient?
//    
//    class var shared: APIClient {
//        guard let uwShare = privateShared else {
//            privateShared = APIClient()
//            return privateShared ?? APIClient()
//        }
//        return uwShare
//    }
//    
//    class func destroy() {
//        privateShared = nil
//    }
    
//   public func objectAPICall<T: Decodable>(apiEndPoint: NetworkRoutes,modelType:T.Type,content:[String] = ["application/json"],completion: @escaping CompletionHandler<T>) {
//        
//        AF.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query,encoding: apiEndPoint.encoding,headers: apiEndPoint.headers,requestModifier: apiEndPoint.requestModifier)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: content)
//            .responseDecodable(of: modelType.self) { response in
//                switch response.result {
//                case .success(let value):
//                    completion(Result.success(value))
//                case .failure(let error):
//                    guard let statusCode = response.response?.statusCode else {
//                        let unKnownError = ErrorResponse(-999, response.data, error)
//                        completion(Result.failure(unKnownError))
//                        return
//                    }
//                    let mError = ErrorResponse(statusCode, response.data, error)
//                    completion(Result.failure(mError))
//                }
//                
//            }
//        
//    }
    
     func formDataAPICall(deepai:DeepAISDK,apiEndPoint: NetworkRoutes,content:[String] = ["application/json"],completion: @escaping CompletionHandler) {
        AF.upload(multipartFormData: { multipartFormData in
            if let data = apiEndPoint.query["data"] as? Data {
                multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
            }
        }, to: apiEndPoint.path,headers:deepai.baseMultipartHeaders)
        .validate(statusCode: 200..<300)
        .validate(contentType: content)
        .responseDecodable(of: ImageResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(Result.success(value))
            case .failure(let error):
                guard let statusCode = response.response?.statusCode else {
                    let unKnownError = ErrorResponse(-999, response.data, error)
                    completion(Result.failure(unKnownError))
                    return
                }
                let mError = ErrorResponse(statusCode, response.data, error)
                completion(Result.failure(mError))
            }
        }
    }
    
}
