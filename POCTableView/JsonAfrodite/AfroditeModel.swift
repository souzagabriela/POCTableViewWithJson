//
//  AfroditeModel.swift
//  POCTableView
//
//  Created by Gabriela Souza Batista on 29/11/22.
//

import Foundation

// MARK: - Lista de receitas
struct Afrodites: Codable {
    let afrodite: [Afrodite]
}

// MARK: - Model JSON
struct Afrodite: Codable {
    let id: IDReceita
    let nome: String
    let secao: [Secao]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case nome, secao
    }
}

// MARK: - ID
struct IDReceita: Codable {
    let oid: String

    enum CodingKeys: String, CodingKey {
        case oid = "$oid"
    }
}

// MARK: - Seção
struct Secao: Codable {
    let nome: String
    let conteudo: [String]
}
