//
//  File.swift
//  DeepAISDK
//
//  Created by Md Abdul Gafur on 27/11/24.
//

import Foundation
import Testing
@testable import DeepAISDK

@Test func Colorizer() async {
    let deepAisdk = DeepAISDK(apiToken: "479ec491-2f42-4665-80cf-8df9175ca6d9")
    deepAisdk.sendImageEditRequest(Data(), editType: .backgroundRemover, complete: { isSucess, url in
        #expect(isSucess == true)
    })
}
