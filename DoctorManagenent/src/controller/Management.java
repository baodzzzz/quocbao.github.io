/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import model.Doctor;

/**
 *
 * @author yendo
 */
public class Management {

    private ArrayList<Doctor> doctorList = null;

    public ArrayList<Doctor> getDoctorList() {
        return doctorList;
    }

    public void setDoctorList(ArrayList<Doctor> doctorList) {
        this.doctorList = doctorList;
    }

    public Management() {
        this.doctorList = new ArrayList<>();
    }

    public int autoID() {
        if (doctorList.isEmpty()) {
            return 1;
        }
        return doctorList.get(doctorList.size() - 1).getId() + 1;
    }

    public Management(ArrayList<Doctor> doc) {
        this.doctorList = doc;
    }

    public Doctor finID(int id) {
        for (Doctor doctor : doctorList) {
            if (doctor.getId() == id) {
                return doctor;
            }
        }
        return null;
    }

    public void addDoctor(Doctor d) {
        doctorList.add(d);
    }

    public void setDoctor(Doctor d) {
        for (int i = 0; i < doctorList.size(); i++) {
            if (d.getId() == doctorList.get(i).getId()) {
                doctorList.set(i, d);
                break;
            }
        }
    }

    public void removeDoctor(int ID) {
        for (Doctor doctor : doctorList) {
            if (ID == doctor.getId()) {
                doctorList.remove(doctor);
                break;
            }
        }
    }

    public void Sort() {
        Collections.sort(doctorList, new Comparator<Doctor>() {
            @Override
            public int compare(Doctor o1, Doctor o2) {
                if (o1.getDOB().after(o2.getDOB())) {
                    return 1;
                } else if (o1.getDOB().before(o2.getDOB())) {
                    return -1;
                } else {
                    return 0;
                }
            }
        });
    }

}
