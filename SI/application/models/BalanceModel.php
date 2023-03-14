<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BalanceModel extends CI_Model{
    public function getBalance(){
        $sql = "select comptes.numerocompte as numerocompte, comptes.nomcompte as nomcompte,balance_comptes.mvt_debit as mvt_debit,
                balance_comptes.mvt_credit as mvt_credit,balance_comptes.solde_debit as solde_debit,balance_comptes.solde_credit as solde_credit
                from comptes join balance_comptes on comptes.numerocompte = balance_comptes.numerocompte";
        $query = $this->db->query($sql) ;
        $retour = null;
        foreach($query->result_array() as $row){
            $retour[] = $row;
       }
       return $retour;
    }
}
?>