import { LightningElement, wire, track } from 'lwc';
import getAllContacts from '@salesforce/apex/contactController.getAllContacts';


export default class ContactTable extends LightningElement {
    @track contacts
    @wire(getAllContacts) getContact({data, error}){
        if(error){
            throw Exception('Cant get contacts')
        }
        this.contacts = data
    }
}