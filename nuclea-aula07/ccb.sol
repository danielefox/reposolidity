// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title CCB
 * @dev Operacoes de uma CCB
 * @author Daniele Raposo
 */
contract CCB is Titulo, Owner {
    string public _emissor;
    uint256 public _valor;
    uint256 public _dataEmissao;
    uint256 public _prazoPagamento;

    event CCBLiquidado(uint256 valorLiquidado);

    constructor() {
        _emissor = "Banco Top";
        _valor = 30000000;
        _dataEmissao = block.timestamp;
        _prazoPagamento = _dataEmissao  + 30 days;
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view override returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view override returns (string memory) {
        return _emissor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view override returns (uint256) {
        return _dataEmissao;
    }

    /**
    * @dev muda o prazo de pagamento
    * @notice dependendo da situacao economica o prazo de pagamento pode mudar
    * @param prazoPagamento_ novo prazo de pagamentos a ser adicionado. Em segundos
    */
    function mudaDataPagamento(uint256 prazoPagamento_) external onlyOwner returns (uint256) {
        emit NovoPrazoPagamento(_prazoPagamento, _prazoPagamento + prazoPagamento_);
        _prazoPagamento = _prazoPagamento + prazoPagamento_;
        return _prazoPagamento;
    }
}
