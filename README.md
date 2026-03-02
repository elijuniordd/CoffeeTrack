# CoffeeTrack — Projeto de Aprendizado Salesforce com VS Code

## Sobre o projeto
O **CoffeeTrack** é um projeto Salesforce DX criado para consolidar aprendizados do **Trailhead** na prática.

O foco principal é:
- modelagem de dados com objetos customizados;
- automação com Flow;
- organização de metadados em projeto versionável;
- integração do fluxo de desenvolvimento entre **Salesforce Org** e **VS Code** usando Salesforce CLI.

## Objetivo de aprendizado
Este repositório foi estruturado para apoiar sua evolução em:
- desenvolvimento declarativo e programático no ecossistema Salesforce;
- boas práticas de source-driven development com SFDX;
- recuperação e envio de metadados entre org e projeto local;
- uso do VS Code como ambiente principal de desenvolvimento.

## Integração Salesforce + VS Code
No dia a dia, o ciclo de trabalho deste projeto pode seguir este padrão:

1. Autenticar a org no CLI.
2. Recuperar metadados da org para o projeto local.
3. Evoluir os artefatos no VS Code.
4. Fazer deploy das mudanças para a org.

Comandos úteis:

```bash
sf org list
sf project retrieve start --target-org vscodeOrg --manifest manifest/package.xml
sf project deploy start --target-org vscodeOrg --manifest manifest/package.xml
```

> Dica: mantenha o alias da org consistente (ex.: `vscodeOrg`) para evitar erros de `NamedOrgNotFoundError`.

## Análise da estrutura do projeto

### Raiz
- `package.json`: scripts e dependências do projeto (incluindo lint/test).
- `sfdx-project.json`: configuração do projeto Salesforce DX (package directories, namespace, API version etc.).
- `jest.config.js` e `eslint.config.js`: suporte a testes e qualidade de código.
- `manifest/package.xml`: manifesto de metadados para retrieve/deploy dirigido.

### `force-app/main/default`
Pasta principal de metadados Salesforce.

- `objects/`: modelagem de dados customizada.
	- `Fazenda__c/`
		- `Fazenda__c.object-meta.xml`
		- campos como `Produtor__c` e `Regiao_o__c`
	- `Lote_de_Caf__c/`
		- `Lote_de_Caf__c.object-meta.xml`
		- campos como `Altitude__c`, `Fazenda__c`, `Sacas_Produzidas__c`, `Status_Especial__c` e `Variedade__c`
- `flows/`: automações declarativas.
	- `Verificar_Se_Caf_especial.flow-meta.xml`
- `classes/`, `triggers/`, `lwc/`, `aura/`: camadas para lógica Apex e componentes de interface (prontas para evolução).
- `layouts/`, `tabs/`, `flexipages/`, `permissionsets/`: metadados de experiência e segurança.

### Outras pastas úteis
- `config/`: definições auxiliares, incluindo scratch org (`project-scratch-def.json`).
- `scripts/apex` e `scripts/soql`: scripts de apoio para execução rápida no ambiente de desenvolvimento.

## Próximos passos sugeridos
- criar Permission Sets específicos por perfil de usuário;
- adicionar validações e/ou fórmulas nos objetos principais;
- expandir automações com Flows adicionais (notificações, aprovações, enriquecimento de dados);
- incluir testes de Apex quando houver classes e triggers de negócio;
- organizar um backlog de histórias Trailhead aplicadas diretamente neste repositório.

## Referências
- [Salesforce Extensions for VS Code](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Trailhead](https://trailhead.salesforce.com/)
