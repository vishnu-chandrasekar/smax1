@isTest
public class AP_ApplicationController_Test {
    static testmethod void testcontrol() {
        Boolean Submitted = True;
        Attachment myAttachment =New attachment();
        Test.startTest();
        ApplicationController AC = new ApplicationController();
		AC.upload();
        Test.StopTest();
    }

}