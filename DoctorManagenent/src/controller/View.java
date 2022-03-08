/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Doctor;

/**
 *
 * @author yendo
 */
public class View {

    Management mn;

    public View(Management mn) {
        this.mn = mn;
    }

    public View() {
        mn = new Management();
        try {
            setInit();
        } catch (ParseException ex) {
            Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inputDoctor() {
        while (true) {
            int id = mn.autoID();
            String name = Validation.inputName("Enter name: ");
            Date dob = Validation.inputDate("Enter D.O.B: ", "dd/MM/yyyy");
            String status = getStatus();
            String email = Validation.inputEmail("Enter email: ");
            String phone = Validation.inputPhone("Enter phone number: ");
            Doctor d = new Doctor(id, name, dob, email, phone, status);
            addDoctor(d);
            if (!Validation.checkYesNo("Do you want to add more? (Y/N): ")) {
                break;
            }
        }
    }

    private String getStatus() {
        System.out.println("Please choose one in four states.");
        System.out.println("0. In vacation.");
        System.out.println("1. Available.");
        System.out.println("2. Busy in emergency case.");
        System.out.println("3. In diagnosing case.");

        int choice;
        while (true) {
            choice = Validation.inputInt("Select from 0 to 3: ");
            if (0 <= choice && choice <= 3) {
                break;
            } else {
                System.err.println("You must choose from 0 to 3! Enter again.");
            }
        }

        switch (choice) {
            case 0:
                return "In vacation";
            case 1:
                return "Available";
            case 2:
                return "Busy in emergency case";
            case 3:
                return "In diagnosing case";
        }

        return null;
    }

    public void editDoctor() {
        if (mn.getDoctorList().isEmpty()) {
            System.err.println("Doctor list null. Please add doctor first.");
            return;
        }
        while (true) {
            int id = inputID();
            Doctor d = mn.finID(id);
            if (d != null) {
                mn.setDoctor(editInfor(d));
                System.err.println("=>Edit successful.");
            } else {
                System.err.println("Not found doctor with ID: " + id);
            }
            if (!Validation.checkYesNo("Do you want to edit another doctor? (Y/N) ")) {
                break;
            }
        }
    }

    public int inputID() {
        while (true) {
            int id = Validation.inputInt("Enter ID of doctor you want: ");
            if (id <= 0) {
                System.err.println("ID be positive number! Re-enter.");
            } else {
                return id;
            }
        }
    }

    private Doctor editInfor(Doctor d) {
        while (true) {
            if (Validation.checkYesNo("Do you want to edit name? (Y/N): ")) {
                String name = Validation.inputName("New name: ");
                if (name.equals(d.getName())) {
                    System.err.println("Name not change!");
                } else {
                    d.setName(name);
                    break;
                }
            } else {
                break;
            }
        }

        while (true) {
            if (Validation.checkYesNo("Do you want to edit email? (Y/N): ")) {
                String email = Validation.inputEmail("New email: ");
                if (email.equals(d.getEmail())) {
                    System.err.println("Email not change!");
                } else {
                    d.setEmail(email);
                    break;
                }
            } else {
                break;
            }
        }

        while (true) {
            if (Validation.checkYesNo("Do you want to edit phone number? (Y/N): ")) {
                String phone = Validation.inputPhone("New phone: ");
                if (phone.equals(d.getPhone())) {
                    System.err.println("Phone not change!");
                } else {
                    d.setPhone(phone);
                    break;
                }
            } else {
                break;
            }
        }

        while (true) {
            if (Validation.checkYesNo("Do you want to edit status? (Y/N): ")) {
                String status = getStatus();
                if (status.equals(d.getStatus())) {
                    System.err.println("Status not change!");
                } else {
                    d.setStatus(status);
                    break;
                }
            } else {
                break;
            }
        }

        return d;
    }

    public void deleteDoctor(int ID) {
        mn.removeDoctor(ID);
        System.err.println("Delete successful");
    }

    public void Search() {
        if (mn.getDoctorList().isEmpty()) {
            System.err.println("Doctor list null. Please add doctor first.");
            return;
        }
        while (true) {
            System.out.println("Do you want to search by ID or by name?");
            System.out.println("1. Search by ID.");
            System.out.println("2. search by Name.");
            int choice = Validation.inputInt("=>You choice: ");
            switch (choice) {
                case 1:
                    int id = inputID();
                    System.out.println("Search By ID:");

                    if (searchByID(id) != null) {
                        searchByID(id).display();
                    } else {
                        System.err.println("Not found doctor with ID: " + id);
                    }

                    break;
                case 2:
                    System.out.println("Search By Name:");
                    String key = Validation.inputName("Enter key: ");
                    searchByName(key);
                    break;
                default:
                    System.err.println("You must choose 1 or 2! Enter again.");
            }

            if (!Validation.checkYesNo("Do you want to continue search? (Y/N): ")) {
                break;
            }
        }
    }

    public Doctor searchByID(int id) {
        if (mn.finID(id) != null) {
//            Header();
//            mn.finID(id).display();
            return mn.finID(id);
        }
        return null;
    }

    public ArrayList<Doctor> searchByName(String name) {
        ArrayList<Doctor> doctors = new ArrayList<>();

        Header();
        for (Doctor doctor : mn.getDoctorList()) {
            if (doctor.getName().toLowerCase().contains(name.toLowerCase())) {
                doctor.display();
                doctors.add(doctor);
            }
        }
        if (doctors.isEmpty()) {
            System.err.println("Not found doctor contains (" + name + ") in name!");
        }

        return doctors;
    }

    public void Header() {
        System.out.printf("%-10s | %-11s | %-11s | %-13s | %-30s | %-30s\n",
                "ID", "Name", "DOB", "Phone Number", "Status", "Email");
    }

    public void SortByDOB() {
        if (mn.getDoctorList().isEmpty()) {
            System.err.println("Doctor list null. Please add doctor first.");
            return;
        }
        mn.Sort();
        System.out.println("After sort:");
        display();
    }

    public void display() {
        Header();
        for (Doctor doctor : mn.getDoctorList()) {
            doctor.display();
        }
    }

    public void setInit() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        ArrayList<Doctor> doctors = new ArrayList<>();
        mn.getDoctorList().add(new Doctor(1, "a", sdf.parse("01/02/1988"), "a@gmail.com", "000-111-2222", "Available"));
        mn.getDoctorList().add(new Doctor(2, "ab", sdf.parse("12/04/1989"), "ab@gmail.com", "111-222-3333", "in vacation"));
        mn.getDoctorList().add(new Doctor(3, "ac", sdf.parse("01/03/1973"), "ac@gmail.com", "012-123-1234", "Busy in emergency case"));
        mn.getDoctorList().add(new Doctor(4, "ab", sdf.parse("19/05/1992"), "AB1@gmail.com", "999-999-9999", "In diagnosing case"));
        mn.getDoctorList().add(new Doctor(5, "abd", sdf.parse("31/03/1983"), "ABD@gmail.com", "789-654-3210", "In diagnosing case."));
    }

    public void addDoctor(Doctor d) {
        mn.addDoctor(d);
    }

    public ArrayList<Doctor> setList() {
        ArrayList<Doctor> doctors = new ArrayList<>();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            doctors.add(new Doctor(1, "a", sdf.parse("01/02/1988"), "a@gmail.com", "000-111-2222", "Available"));
            doctors.add(new Doctor(2, "ab", sdf.parse("12/04/1989"), "ab@gmail.com", "111-222-3333", "in vacation"));
            doctors.add(new Doctor(3, "ac", sdf.parse("01/03/1973"), "ac@gmail.com", "012-123-1234", "Busy in emergency case"));
            doctors.add(new Doctor(4, "ab", sdf.parse("19/05/1992"), "AB1@gmail.com", "999-999-9999", "In diagnosing case"));
            doctors.add(new Doctor(5, "abd", sdf.parse("31/03/1983"), "ABD@gmail.com", "789-654-3210", "In diagnosing case."));
        } catch (ParseException ex) {
            Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
        }
        return doctors;
    }
}
