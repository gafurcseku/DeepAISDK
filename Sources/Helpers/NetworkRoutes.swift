import Foundation
import Alamofire

let baseURL = "https://api.deepai.org/api/"

protocol NetworkRoutes {
    var method:HTTPMethod { get }
    var path:String { get }
    var query:[String:Any] { get }
    var encoding: ParameterEncoding {get set}
}

extension NetworkRoutes {
    var encoding:ParameterEncoding {get {
        return JSONEncoding.default
    } set{}}
}
