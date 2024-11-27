import Alamofire

public final class DeepAISDK {
    private let apiToken: String
    internal var network = APIClient()
    public init(apiToken: String) {
        self.apiToken = apiToken
    }
}

public extension DeepAISDK {
    var baseMultipartHeaders: HTTPHeaders {
        var headers: HTTPHeaders = [:]
        headers["api-key"] = apiToken
        headers["content-type"] = "multipart/form-data"
        return headers
    }
}

