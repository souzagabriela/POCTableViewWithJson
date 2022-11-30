//
//  JsonTeste.swift
//  POCTableView
//
//  Created by Gabriela Souza Batista on 29/11/22.
//

import Foundation

class JsonTeste {

    static let instance = JsonTeste()

    func loadjson() -> [Afrodite] {
        if let url = Bundle.main.url(forResource: "Afrodite", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [Afrodite] = try decoder.decode([Afrodite].self, from: data)
//                print(jsonData)
                return jsonData
            } catch {
                print(error)
            }
        }
        return [Afrodite(id: IDReceita(oid: ""), nome: "", secao: [Secao(nome: "", conteudo: [""])])]
    }

    private init() {}

}
