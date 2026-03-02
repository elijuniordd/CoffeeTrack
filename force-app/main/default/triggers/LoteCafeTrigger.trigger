trigger LoteCafeTrigger on Lote_de_Caf__c (before insert, before update) {
    if(Trigger.isBefore) {
        LoteCafeTriggerHandler.calcularPontuacao(Trigger.new);  
    }
}