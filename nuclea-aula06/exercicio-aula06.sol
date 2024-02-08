/*
SPDX-License-Identifier: CC-BY-4.0  
(c) Desenvolvido por Daniele Raposo
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/
// Endereco do contrato na rede Sepolia: 0xFd4Fb3254df59CEe3C4859ff9d8FaaF7e80FB2CE

pragma solidity 0.8.19;

/// @author Daniele Raposo
/// @title Contrato de Registro de Compras

contract RegistroCompras {
    mapping(address => uint256) public itensAdquiridos;

    event CompraRegistrada(address comprador, uint256 quantidade);

    // @notice Registra a compra de um item
    // @dev Adiciona a quantidade de itens adquiridos ao mapa itensAdquiridos associado ao endereco do comprador
    // @param quantidade A quantidade de itens adquiridos
    // @return A quantidade total de itens adquiridos apos a compra
    function registrarCompra(uint256 quantidade) public returns (uint256) {
        itensAdquiridos[msg.sender] += quantidade;
        emit CompraRegistrada(msg.sender, quantidade);
        return itensAdquiridos[msg.sender];
    }
}