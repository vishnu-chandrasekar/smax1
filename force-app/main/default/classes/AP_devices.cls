public with sharing class AP_devices {

    public ApexPages.StandardController employeeController {get; set;}
	public List<EmployeeDevice__c> Employeedevice {get; set;}
    public String currentRecordId {get;set;}
	
	public ApexPages.StandardController myUserController {get; set;}
	//public Device__c Device {get; set;}
    //public Device__c Device2 {get; set;}
 
    public list<Device__c> Devicelist {get; set;}
    
   
    public List<string> lst{get;set;}
	
	public ApexPages.StandardController standardContactController;
	integer EDeviceCount,NoofDevices,devicecount,count;
    

	public AP_devices (ApexPages.StandardController cntrl) {
		
		standardContactController = cntrl;
		Employee__c emp = (Employee__c)cntrl.getRecord();
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        EDeviceCount=[select count() from EmployeeDevice__c where Employee__c=:currentRecordId];
        system.debug('Count of devices'+EDeviceCount);
        Employeedevice = [select id,Name,Device_assigned__c,SerialNumber__c from EmployeeDevice__c where Employee__c = :currentRecordId];
		system.debug('Device'+Employeedevice);
      	NoofDevices=[select count() from Device__c];
        system.debug('No Of Devices'+NoofDevices);
        
        
        /******************
       
     for(count=0;count<EDeviceCount;count++){
            system.debug('countvalue'+count);
            Device3= [select Id,Name,MaterialType__c from Device__c where SerialNumber__c=:Employeedevice[count].SerialNumber__c];
			system.debug('Device3value'+Device3);

			Devicelist.add(Device3);            
         }
         **********************/ 
                 
		Devicelist=new list<Device__c>();
        for(EmployeeDevice__c e:Employeedevice){
            Device__c Device3= [select Id,Name,MaterialType__c,SerialNumber__c from Device__c where SerialNumber__c=:e.SerialNumber__c];
            
            Devicelist.add(Device3);      
            system.debug('devicelist---'+Devicelist);

            
        }
         system.debug('devicelist---'+Devicelist);
        
        //Device= [select Id,Name,MaterialType__c from Device__c where SerialNumber__c=:Employeedevice[0].SerialNumber__c];
        //Device2=[select Id,Name,MaterialType__c from Device__c where SerialNumber__c=:Employeedevice[1].SerialNumber__c];
        //system.debug('material'+Device.MaterialType__c);
        //system.debug('material2'+Device2.MaterialType__c);
        
	}

}