import { LightningElement, wire, track } from 'lwc';
import getLeads from '@salesforce/apex/leadController.getLeads';


export default class LeadsTable extends LightningElement {
    @track leads

    @wire(getLeads) leadsHandler({data, error}){
        if(error){
            throw Exception('Cant get leads')
        }
        this.leads = data
    }

}