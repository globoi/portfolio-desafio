//
//  MenuItems.swift
//  NewsLetterFeedApp
//
//  Created by Matheus Henrique Mendes Alexandre on 14/12/23.
//

import Foundation

enum MenuItemType: String {
    case agro = "agro"
    case bemEstar = "bem estar"
    case carros = "carros"
    case cienciaESaude = "ciência e saúde"
    case economia = "economia"
    case educacao = "educação"
    case fatoOuFake = "fato ou fake"

    var url: String {
        switch self {
        case .agro: return "http://g1.globo.com/economia/agronegocios/"
        case .bemEstar: return "https://g1.globo.com/bemestar/"
        case .carros: return "http://g1.globo.com/carros/"
        case .cienciaESaude: return "http://g1.globo.com/ciencia-e-saude/"
        case .economia: return "http://g1.globo.com/economia/"
        case .educacao: return "http://g1.globo.com/educacao/"
        case .fatoOuFake: return "https://g1.globo.com/fato-ou-fake/"
        }
    }
}

struct MenuItem: Identifiable {
    var id: Int
    
    let title: String
    let url: String
}

struct Menu {
    static let menuItems: [MenuItem] = [
        MenuItem(id: 0, title: MenuItemType.agro.rawValue, url: MenuItemType.agro.url),
        MenuItem(id: 1, title: MenuItemType.bemEstar.rawValue, url: MenuItemType.bemEstar.url),
        MenuItem(id: 2, title: MenuItemType.carros.rawValue, url: MenuItemType.carros.url),
        MenuItem(id: 3, title: MenuItemType.cienciaESaude.rawValue, url: MenuItemType.cienciaESaude.url),
        MenuItem(id: 4, title: MenuItemType.economia.rawValue, url: MenuItemType.economia.url),
        MenuItem(id: 5, title: MenuItemType.educacao.rawValue, url: MenuItemType.educacao.url),
        MenuItem(id: 6, title: MenuItemType.fatoOuFake.rawValue, url: MenuItemType.fatoOuFake.url)
    ]
}

