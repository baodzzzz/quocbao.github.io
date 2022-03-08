/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.ParseException;

/**
 *
 * @author yendo
 */
public class Main {

    public static void main(String[] args) throws ParseException {
        Management mn = new Management();
        View v = new View(mn);
        while (true) {
            System.out.println("WELCOME DOCTOR MANAGEMENT SYSTEM");
            System.out.println("1. Create a Doctor\n"
                    + "2. Edit a Doctor Information\n"
                    + "3. Delete a Doctor\n"
                    + "4. Search doctor by ID and by Name\n"
                    + "5. Sort doctor by DateOfBirth");
            System.out.println("6. Exit.");
            int choice = Validation.inputInt("=> Your choice: ");
            switch (choice) {
                case 1:
                    v.inputDoctor();
                    break;
                case 2:
                    v.editDoctor();
                    break;
                case 3:
                    if (mn.getDoctorList().isEmpty()) {
                        System.err.println("Doctor list null. Please add doctor first.");
                    } else {
                        int id = v.inputID();
                        if (mn.finID(id) != null) {
                            v.deleteDoctor(id);
                        } else {
                            System.err.println("Not found doctor with ID: " + id);
                        }
                    }
                    System.out.println("");
                    break;

                case 4:
                    v.Search();
                    System.out.println("");
                    break;
                case 5:
                    v.SortByDOB();
                    System.out.println("");
                    break;
                case 6:
                    System.exit(0);
                case 7:
                    v.setInit();
                    break;
                case 8:
                    v.display();
                    System.out.println("");
                    break;
                default:
                    System.err.println("You must choose from 1 to 6! Re-enter.");
            }
        }
    }

}
