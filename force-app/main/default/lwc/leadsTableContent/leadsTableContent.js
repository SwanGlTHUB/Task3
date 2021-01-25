import { LightningElement, api, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import changeFields from '@salesforce/apex/leadController.changeFields'

export default class LeadsTableContent extends NavigationMixin(LightningElement) {
    @api lead
    @api titlevalue
    @api phonevalue

    changeLeadFields(title, phone, id){
        let params = {
            title: title,
            phone: phone,
            recordId: id
        }
        
        changeFields(params)
        .catch((error) => {
            console.log(error)
        })
    }

    phoneChangeHandler(event){
        this.phonevalue = event.target.value
        this.changeLeadFields(this.titlevalue, this.phonevalue, this.lead.Id)
    }
    
    titleChangeHandler(event){
        this.titlevalue = event.target.value
        this.changeLeadFields(this.titlevalue, this.phonevalue, this.lead.Id)
    }

    handleRedirectToLeadPage(event){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.lead.Id,
                objectApiName: 'Lead',
                actionName: 'view'
            },
        });
    }
}