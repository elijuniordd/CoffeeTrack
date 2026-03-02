public with sharing class LoteCafeTriggerHandler {
    public static void calcularPontuacao(List<Lote_de_Caf__c> novosLotes){
        for(Lote_de_cof_c lote : novosLotes) {
            Decimal corpo = lote.Corpo__c != null ? lote.Corpo__c : 0;
            Decimal acidez = lote.Acidez__c != null ? lote.Acidez__c : 0;
            Decimal docura = lote.Docura__c != null ? lote.Docura__c : 0;

            Decimal mediaSCA = (corpo + acidez + docura) / 3;
            lote.Nota_SCA__c = mediaSCA;

            if(mediaSCA>=80){
                lote.stats__c = 'Pronto para Exportação';

            }
        }
    }
}