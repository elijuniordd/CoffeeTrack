# CoffeeTrack — Projeto de Aprendizado Salesforce com VS Code

## Sobre o projeto
☕ CoffeeTrack Minas — Gestão e Rastreabilidade de Café
O CoffeeTrack Minas é um ecossistema Salesforce desenvolvido para modernizar o rastreio da produção de cafés especiais em Minas Gerais. O projeto abrange desde a modelagem de dados robusta até interfaces modernas e integrações simuladas, consolidando boas práticas de desenvolvimento source-driven com SFDX.

## Arquitetura e Modelagem de Dados (DER)
A base do projeto foi planejada para garantir integridade referencial e escalabilidade.

Objetos Customizados:
Fazenda (Fazenda__c): Armazena dados do produtor e região (Sul de Minas, Cerrado, etc.).
Lote de Café (Lote_de_Caf__c): Gerencia variedades, altitude e a classificação de qualidade.

Relacionamentos: Implementação de Master-Detail entre Fazenda e Lote para garantir que nenhum lote exista sem uma origem definida.
<img width="1346" height="688" alt="image" src="https://github.com/user-attachments/assets/2b56da19-5f08-4056-84ea-1763051ea92b" />

## Automações Declarativas (Low-Code)
Para otimizar a operação no campo, utilizei o Salesforce Flow para inteligência imediata nos dados.

Fluxo de Café Especial: Um Record-Triggered Flow (Before-Save) que valida automaticamente a altitude do lote. Se a altitude for superior a 1000m, o registro é marcado com o selo de "Potencial Café Especial".
<img width="1888" height="649" alt="image" src="https://github.com/user-attachments/assets/2ade96ab-e307-4e49-9801-e14946e9af7e" />

## Interface e Experiência do Usuário (LWC)
Criação de um Portal do Comprador utilizando Lightning Web Components para uma experiência moderna e reativa.
Componente buyerPortal
Filtros dinâmicos por nota SCA.
Visualização em cards com dados provenientes do Apex via Wire Service.
Integração Mock: Botão que simula o consumo de uma API externa para cotação do Dólar em tempo real.

<img width="1306" height="663" alt="image" src="https://github.com/user-attachments/assets/2c88e6ca-029b-46e3-b052-b78e97e8c255" />

<img width="637" height="213" alt="image" src="https://github.com/user-attachments/assets/f167605a-805b-4a1b-8e97-81530593eead" />


O foco principal é:
- modelagem de dados com objetos customizados;
- automação com Flow;
- organização de metadados em projeto versionável;
- integração do fluxo de desenvolvimento entre **Salesforce Org** e **VS Code** usando Salesforce CLI.

##Tecnologias e Ferramentas
- Salesforce Platform: Admin, Flows, Apex, LWC.
- Desenvolvimento Local: VS Code + Salesforce Extension Pack.
- CLI & Versionamento: Salesforce CLI para Deploy/Retrieve e Git para controle de versão.
- Qualidade: ESLint e Prettier para padronização de código.

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
