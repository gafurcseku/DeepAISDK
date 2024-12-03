import Foundation

extension DeepAISDK {
    
    fileprivate func setNetworkCall(apiEndPoint: ImageEditEndpoint, complete: @escaping @Sendable (Bool, String) -> Void) {
        self.network.formDataAPICall(deepai: self, apiEndPoint: apiEndPoint) { result in
            switch result {
            case .success(let images):
                if let url = images.output_url {
                    complete(true,url)
                }else{
                    complete(false,"Url is Empty")
                }
            case .failure(let error):
                complete(false,error.2.localizedDescription)
                break
            }
        }
    }
    
    public func sendImageEditRequest(_ data: Data,editType:ImageEditType ,complete: @escaping @Sendable (Bool,String) -> Void) {
        var apiEndPoint:ImageEditEndpoint{
            switch editType {
            case .colorizer:
                return ImageEditEndpoint.colorizer(data)
            case .backgroundRemover:
                return ImageEditEndpoint.backgroundRemover(data)
            case .headshots:
                return ImageEditEndpoint.headshots(data,"")
            case .selfieGenerator:
                return ImageEditEndpoint.selfieGenerator(data)
            case .superResolution:
                return ImageEditEndpoint.superResolution(data)
            case .upscales:
                return ImageEditEndpoint.upscales(data)
            case .expand:
                return ImageEditEndpoint.expand(data)
            }
        }
        setNetworkCall(apiEndPoint: apiEndPoint, complete: complete)
    }
    
    public func sendHeadshotsRequest(_ data: Data,prompt:String,editType:ImageEditType ,complete: @escaping @Sendable (Bool,String) -> Void) {
        setNetworkCall(apiEndPoint: ImageEditEndpoint.headshots(data,prompt), complete: complete)
    }
}
