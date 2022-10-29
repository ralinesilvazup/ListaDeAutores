//
//  AutorViewController.swift
//  LearningTask-8.2
//
//  Created by Raline Maria da Silva on 27/10/22.
//

import UIKit


class AutorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var livrosAPI: LivrosAPI?
    var autor: Autor!
    var livrosDoAutor: [Livro] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyTheme()
        
        setupViews()
        carregarLivrosDoAutor()
    }
    
    func carregarLivrosDoAutor() {
        guard let livrosAPI = livrosAPI else { return }
        livrosDoAutor = livrosAPI.carregaLivros(por: autor)
        
    }
    
    private func setupViews() {
        tableView.tableHeaderView = AutorTableHeaderView.constroi(para: autor)
        
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
}

extension AutorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        livrosDoAutor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LivroDoAutorViewCell", for: indexPath) as? LivroDoAutorViewCell else {
            fatalError("Não foi possível obter celula para a lista de autores")
        }
        
        cell.livro = livrosDoAutor[indexPath.row]
        return cell
    }
}

extension AutorViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível recuperar a view de header para a lista de livros do autor")
        }
        
        headerView.titulo = "Livros publicados"
        return headerView
    }
}
