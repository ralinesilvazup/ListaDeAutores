//
//  ViewController.swift
//  LearningTask-8.2
//
//  Created by rafael.rollo on 20/06/2022.
//

import UIKit

class AutoresListViewController: UITableViewController {

    var autorAPI: AutorAPI?
    
    var autores: [Autor] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    
        carregaAutores()
    }

    func carregaAutores() {
        guard let autorAPI = autorAPI else { return }
        self.autores = autorAPI.listaTodos()
    }

}

// MARK: - UITableViewDataSource Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AutorTableViewCell", for: indexPath) as? AutorTableViewCell else {
            fatalError("Não foi possível obter celula para a lista de autores")
        }
        
        let autor = autores[indexPath.row]
        cell.autor = autor
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

