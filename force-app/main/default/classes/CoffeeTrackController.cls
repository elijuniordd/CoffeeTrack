public with sharing class CoffeeTrackController {
    @AuraEnabled(cacheable=true)
    public static List<Lote_de_Caf__c> getLotesDisponiveis(String regiao, Decimal notaMinima){
        String query = 'SELECT Id, Name, Fazenda__r.Name, Fazenda__r.Regiao_o__c, Nota_SCA__c, Variedade__c ' +
                        'FROM Lote_de_Caf__c WHERE Status__c = \'Pronto para Exportação\'';
        if(String.isNotBlank(regiao)) {
            query += ' AND Fazenda__r.Regiao_o__c = :regiao';
        }
        if(notaMinima != null) {
            query += ' AND Nota_SCA__c >= :notaMinima';
        }
        return Database.query(query);
    }
}