import { LightningElement, wire, track } from 'lwc';
import getLotes from '@salesforce/apex/CoffeeTrackController.getLotesDisponiveis';

export default class BuyerPortal extends LightningElement {
    @track notaMinima = 0;
    @track lotes;

    @wire(getLotes, { notaMinima: '$notaMinima' })
    wiredLotes({ error, data }) {
        if (data) this.lotes = data;
        else if (error) console.error(error);
    }

    handleNotaChange(event) {
        this.notaMinima = event.target.value;
    }

    handleCotacao() {
        // Aqui entra o Mock da Integração
        const taxaMock = 5.05; 
        alert('Cotação atual simulada: R$ ' + taxaMock + ' por Dólar (API Mock)');
    }
}