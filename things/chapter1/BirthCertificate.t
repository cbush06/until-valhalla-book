#include <adv3.h>
#include <en_us.h>

birthCertificateFile: Readable, Hidden 'birth certificate file'
    location = courtroomTable
    read = nil
    isNotarized = nil

    name() {
        if(self.isNotarized) return 'notarized birth certificate';
        else return 'birth certificate';
    }

    notarize() {
        self.isNotarized = true;
        notarizeBirthCertificate.awardPoints();
    }

    dobjFor(Take) {
        action() {
            self.isListed = true;
            self.isListedInContents = true;
            inherited();
            ssnCardFile.discovered = true;
            "{You/he} take {the dobj/him} and see your Social Security Card on the table. You'll probably need that.\n ";
        }
    }

    readDesc() {
        if(!self.read) {
            whoAmIAchievement.awardPoints();
            self.read = true;
            self.isListed = true;
            self.isListedInContents = true;
        }
        
        "\n\t\t<b>CERTIFICATE OF LIVE BIRTH</b>
            \n\t\t\t<b>STATE OF CALIFORNIA</b> 
            \b
            THIS CHILD
            \n\tNAME OF CHILD:                 \t\t\t\tReginald Patrick Lunsford
            \n\tSEX:                           \t\t\t\t\t\tMALE
            \n\tDATE:                          \t\t\t\t\t\t05/29/2135
            \n\tHOUR:                          \t\t\t\t\t\t1729
            \b
            PLACE OF BIRTH
            \n\tPLACE OF BIRTH:                \t\t\t\tUkiah Valley Medical Center
            \n\tSTREET ADDRESS:                \t\t\t275 Hospital Drive
            \n\tCITY:                          \t\t\t\t\t\tUkiah
            \n\tCOUNTY:                        \t\t\t\t\tMendocino
            \n\tPLANNED PLACE OF BIRTH:        \tHospital
            \b
            FATHER OF CHILD
            \n\tNAME OF FATHER:                \t\t\tRaymond Lunsford
            \n\tSTATE OF BIRTH:                \t\t\t\tCalifornia
            \n\tDATE OF BIRTH:                 \t\t\t\t11/05/2101
            \b
            MOTHER OF CHILD
            \n\tNAME OF MOTHER:                \t\t\tCheryl Lunsford
            \n\tSTATE OF BIRTH:                \t\t\t\tCalifornia
            \n\tDATE OF BIRTH:                 \t\t\t\t03/17/2103
            \b
            INFORMATION CERTIFICATION
            \n\tCERTIFIED BY:                  \t\t\t\tFather
            \n\tDATE SIGNED:                   \t\t\t\t06/29/2135
            \b
            CERTIFICATION OF BIRTH
            \n\tATTENDANT OR REGISTRAR:        \tSylvia H. Matthews
            \n\tLICENSE NUMBER:                \t\t\tG17899
            \n\tDATE SIGNED:                   \t\t\t\t07/08/2135
            \n\tADDRESS OF ATTENDANT:          \t\t1120 S. Dora Street, Ukiah
            \b
            LOCAL REGISTRAR
            \n\tDATE ACCEPTED 
            \n\t\ \ \ FOR REGISTRATION:        \t\t\t08/15/2135";
    }
;