# wget http://mag.gmu.edu/tmp/astro.csv.gz
# gunzip astro.csv.gz
# sed -i 's/'//g' astro.csv
# python HW3g.py > astro.sql
# sqlite3 astro.db < astro.sql

import csv

print 'PRAGMA foreign_keys=OFF;'
print 'BEGIN TRANSACTION;'
print 'CREATE TABLE ASTRO (Preview text, Collection text, Obs_ID REAL, RA REAL, Dec REAL, Start_Date REAL, Instrument text, Int_Time REAL, Target_Name text, Filter text, Cal_Lev REAL, Obs_Type text, Min_Wavelength REAL, Max_Wavelength REAL, Proposal_ID text, P_I_Name text, Product_ID text, Data_Release text, Field_of_View text, Polygon text, Pixel_Scale REAL, Data_Type text, Moving_Target text, Provenance_Name text, Provenance_Keywords text, Intent text, Target_Type text, Target_Standard REAL, Meta_Release text, Sequence_Number REAL, Algorithm_Name text, Proposal_Title text, Proposal_Keywords text, IQ text, Instrument_Keywords text, Tau text, Molecule text, Transition text, Proposal_Project text, Band text, Prov_Reference text, Prov_Version text, Prov_Project text, Prov_Producer text, Prov_Run_ID text, Prov_Last_Executed text, Prov_Inputs text, Rest_frame_Energy text, planeID REAL, DOWNLOADABLE text, CAOM_Plane_URI text);'

with open('astro.csv','r') as csvfile:
     contents = csv.reader(csvfile, delimiter=',')
     for row in contents:
	 line = row[0] + "','" + row[1] + "','" + row[2] + "','" + row[3] + "','" + row[4] + "','" + row[5] + "','" + row[6] + "','" + row[7] + "','" + row[8] + "','" + row[9] + "','" + row[10] + "','" + row[11] + "','" + row[12] + "','" + row[13] + "','" + row[14] + "','" + row[15] + "','" + row[16] + "','" + row[17] + "','" + row[18] + "','" + row[19] + "','" + row[20] + "','" + row[21] + "','" + row[22] + "','" + row[23] + "','" + row[24] + "','" + row[25] + "','" + row[26] + "','" + row[27] + "','" + row[28] + "','" + row[29] + "','" + row[30] + "','" + row[31] + "','" + row[32] + "','" + row[33] + "','" + row[34] + "','" + row[35] + "','" + row[36] + "','" + row[37] + "','" + row[38] + "','" + row[39] + "','" + row[40] + "','" + row[41] + "','" + row[42] + "','" + row[43] + "','" + row[44] + "','" + row[45] + "','" + row[46] + "','" + row[47] + "','" + row[48] + "','" + row[49] + "','" + row[50]
         print "INSERT INTO ASTRO (Preview, Collection, Obs_ID, RA, Dec, Start_Date, Instrument, Int_Time, Target_Name, Filter, Cal_Lev, Obs_Type, Min_Wavelength, Max_Wavelength, Proposal_ID, P_I_Name, Product_ID, Data_Release, Field_of_View, Polygon, Pixel_Scale, Data_Type, Moving_Target, Provenance_Name, Provenance_Keywords, Intent, Target_Type, Target_Standard, Meta_Release, Sequence_Number, Algorithm_Name, Proposal_Title, Proposal_Keywords, IQ, Instrument_Keywords, Tau, Molecule, Transition, Proposal_Project, Band, Prov_Reference, Prov_Version, Prov_Project, Prov_Producer, Prov_Run_ID, Prov_Last_Executed, Prov_Inputs, Rest_frame_Energy, planeID, DOWNLOADABLE, CAOM_Plane_URI) VALUES ('" + line + "');"
	#print ",".join(row)
print 'COMMIT;'
