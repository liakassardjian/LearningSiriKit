//
//  SomaHandler.swift
//  ExemploIntent
//
//  Created by Lia Kassardjian on 06/04/20.
//  Copyright © 2020 Lia Kassardjian. All rights reserved.
//

import Foundation
import Intents

class SomaHandler: NSObject, SomaIntentHandling {
    
    func handle(intent: SomaIntent, completion: @escaping (SomaIntentResponse) -> Void) {
        guard let x = intent.x, let y = intent.y else {
            let resposta = SomaIntentResponse(code: .dadosInsuficientes, userActivity: nil)
            completion(resposta)
            return
        }
        
        let xDouble = Double(truncating: x)
        let yDouble = Double(truncating: y)
        let resultado = NSNumber(value: xDouble + yDouble)
        
        let sucesso = SomaIntentResponse.success(resultado: resultado)
        completion(sucesso)
    }
    
    func resolveX(for intent: SomaIntent, with completion: @escaping (SomaXResolutionResult) -> Void) {
        if let x = intent.x {
            let xDouble = Double(truncating: x)
            completion(.success(with: xDouble))
        } else {
            completion(.needsValue())
        }
    }
    
    func resolveY(for intent: SomaIntent, with completion: @escaping (SomaYResolutionResult) -> Void) {
        if let y = intent.y {
            let yDouble = Double(truncating: y)
            completion(.success(with: yDouble))
        } else {
            completion(.needsValue())
        }
    }
    
    
}
