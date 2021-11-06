//
//  NSURLSessionPinningDelegate.swift
//  WeatherExplorer
//
//  Created by Rafael Lima on 27/10/2021.
//

import Foundation

// Adapted from OWASP https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning#iOS
// And from https://stackoverflow.com/questions/34223291/ios-certificate-pinning-with-swift-and-nsurlsession
class NSURLSessionPinningDelegate: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {

        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = challenge.protectionSpace.serverTrust {
                let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)

                if isServerTrusted {
                    if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                        let serverCertificateData = SecCertificateCopyData(serverCertificate)
                        let data = CFDataGetBytePtr(serverCertificateData)
                        let size = CFDataGetLength(serverCertificateData)
                        let cert1 = NSData(bytes: data, length: size)
                        let fileDer = Bundle.main.path(forResource: "apiWeatherStack", ofType: "der")

                        if let file = fileDer {
                            if let cert2 = NSData(contentsOfFile: file) {
                                if cert1.isEqual(to: cert2 as Data) {
                                    completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: serverTrust))
                                    return
                                }
                            }
                        }
                    }
                }
            }
        }

        // Pinning failed
        completionHandler(URLSession.AuthChallengeDisposition.cancelAuthenticationChallenge, nil)
    }
}
