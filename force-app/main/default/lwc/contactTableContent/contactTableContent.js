import { LightningElement, api, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class ContactTableContent extends NavigationMixin(LightningElement) {
    @track idName
    @track hasRendered = false
    @api contact
    
    renderedCallback() {
        if (!this.hasRendered) {
            this.idName = this.contact.Id + this.contact.LastName
            this.hasRendered = true;
        }   
    }
    
    handleRedirectToContactPage(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.contact.Id,
                objectApiName: 'Contact',
                actionName: 'view'
            },
        });
    }
}