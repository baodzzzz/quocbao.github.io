/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import model.Doctor;
import model.ValidationForTest;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Ignore;

/**
 *
 * @author yendo
 */
public class ViewTest {


    @Test
    public void testNameLongerThan50Characters() {
        System.out.println("**Name is longer than 50 characters:");
        String expected = "Do Viet Yen Do Viet Yen Yen Viet Do Do Yen Viet One Two Threeeee";
        String actual = ValidationForTest.checkName(expected);
        assertNull("Name > 50 characters", actual);
        System.out.println("");
    }

    @Test

    public void nameContainsSpecialCharacter() {
        System.out.println("**Name contains character: @#$");
        String expected = "Yendv @#$";
        String actaul = ValidationForTest.checkName(expected);
        assertNull("Name not contains special character!", actaul);
        System.out.println("");
    }

    @Test
    public void dobNotCorrectFormat() {
        System.out.println("**Date Of Birth have format is (dd-MM-yyyy):");
        String expected = "29-10-20011";
        System.out.println("Expected value: " + expected);
        boolean actual = ValidationForTest.checkFormatDate(expected, "dd/MM/yyyy");
        assertFalse("DOB correct format", actual);
        System.out.println("");
    }

    @Test
    public void chooseTypeOfState() {
        System.out.println("**Choose wrong type of state, choose 5:");
        String expected = "5";
        boolean actual = ValidationForTest.checkInt(0, 3, expected);
        assertFalse("your option true", actual);
        System.out.println("");
    }

    @Test

    public void checkValidEmail() {
        System.out.println("**Input email with any format: input email is (abcdefghiklmj!)");
        String expected = "abcdefghiklmj!";
        boolean actual = ValidationForTest.checkFormatEmail(expected);

        assertFalse("Email valid", actual);
        System.out.println("");
    }

    @Test

    public void checkFormatPhone() {
        System.out.println("**Input phone with any format. Enter phone: 000-8654-3567864ss");
        String expected = "000-8654-3567864ss";
        boolean actual = ValidationForTest.checkPhone(expected);
        assertFalse("Phone valid", actual);
        System.out.println("");
    }

    @Test

    public void inputIDNotHaveForEdit() {
        System.out.println("**ID not have in list for edit. Enter ID = 10");
        View v = new View();
        Management mn = new Management();
        mn.setDoctorList(v.setList());
        int expected = 10;
        Doctor actual = mn.finID(expected);
        boolean flag = false;
        if (actual == null) {
            flag = true;
        }

        assertTrue("=>Found doctor with ID is 10", flag);
        System.out.println("=> Not found doctor with ID 10\n");
    }

    @Test

    public void checkYesNotTest() {
        System.out.println("**Check Yes/No. Enter (o):");
        String expected = "o";
        boolean actual = ValidationForTest.checkYesNo(expected);
        assertFalse("Correct input", actual);

        System.out.println("");
    }

    @Test
    public void checkNewNameValidForEdit() {
        System.out.println("**Check new name, enter \"yendo12\"");
        String expected = "yendo12";
        String actual = ValidationForTest.checkName(expected);
        assertNull("Name valid", actual);
        System.out.println("");
    }

    @Test
    public void InputIDIsZero() {
        System.out.println("Input ID is 0:");
        String expected = "0";
        boolean actual = ValidationForTest.checkInt(1, 5, expected);
        assertFalse("ID valid", actual);
        System.out.println("");
    }

    @Test
    public void InputIDIsNegativeNumber() {
        System.out.println("Input ID is -1:");
        String expected = "-1";
        boolean actual = ValidationForTest.checkInt(1, 5, expected);
        assertFalse("ID valid", actual);
        System.out.println("");
    }

    @Test
    public void InputIDIsCharacterForDelete() {
        System.out.println("Input ID is no:");
        String expected = "no";
        boolean actual = ValidationForTest.checkInt(1, 5, expected);
        assertFalse("ID valid", actual);
        System.out.println("");
    }

    @Test

    public void inputIDNotHaveForDelete() {
        System.out.println("**ID not have in list. Enter ID = 6");
        View v = new View();
        Management mn = new Management();
        mn.setDoctorList(v.setList());
        int expected = 10;
        Doctor actual = mn.finID(expected);
        boolean flag = false;
        if (actual == null) {
            flag = true;
        }

        assertTrue("=>Found doctor with ID is 6", flag);
        System.out.println("=> Not found doctor with ID 6\n");
    }

    @Test

    public void checkListListNullForDelete() {
        System.out.println("**Check list doctor Null or not Null for delete:");
        Management mn = new Management();
        boolean flag = true;
        if (mn.getDoctorList().isEmpty()) {
            flag = false;
        }
        assertFalse("List doctor not null", flag);
        System.out.println("Doctor list null. Please add doctor first.\n");
    }

    @Test
    public void InputIDIsCharacterForSearch() {
        System.out.println("Input ID not contains in search: 123oke");
        String expected = "123oke";
        boolean actual = ValidationForTest.checkInt(1, 5, expected);
        assertFalse("ID valid", actual);
        System.out.println("");
    }

    @Test

    public void inputIDNotHaveForSearch() {
        System.out.println("**ID not have in list for search. Enter ID = 7");
        View v = new View();
        Management mn = new Management();
        mn.setDoctorList(v.setList());
        int expected = 10;
        Doctor actual = mn.finID(expected);
        boolean flag = false;
        if (actual == null) {
            flag = true;
        }

        assertTrue("=>Found doctor with ID is 6", flag);
        System.out.println("=> Not found doctor with ID 6\n");
    }

    @Test

    public void checkListListNullForSearch() {
        System.out.println("**Check list doctor Null or not Null for Search:");
        Management mn = new Management();
        boolean flag = true;
        if (mn.getDoctorList().isEmpty()) {
            flag = false;
        }
        assertFalse("List doctor not null", flag);
        System.out.println("Doctor list null. Please add doctor first.\n");
    }

    @Test
    public void SearchDoctorHaveNameNotContainsKeyValue() {
        System.out.println("**Search doctor(s) have name not contains key value. Key value is(testttt)");
        View v = new View();
        ArrayList<Doctor> actual = v.searchByName("testttt");
        boolean flag = false;
        if (actual.isEmpty()) {
            flag = true;
        }
        assertTrue("Find doctor with name", flag);
        System.out.println("Not found doctor contains (testttt) in name!\n"
                + "Do you want to continue search? (Y/N):\n");
    }

    @Test
    public void notInputKeyForSearchByName() {
        System.out.println("**Not input name for search by name:");
        String expected = "";
        String actual = ValidationForTest.checkName(expected);
        assertNull("Name valid", actual);
        System.out.println("");
    }

    @Test
    public void checkSortByDOB() {
        System.out.println("**Sort by DOB:");
        View v = new View();
        Management mn = new Management(v.setList());
        mn.Sort();
        boolean flag = true;
        for (int i = 0; i < mn.getDoctorList().size()-1; i++) {
            if (mn.getDoctorList().get(i).getDOB().after(mn.getDoctorList().get(i + 1).getDOB())) {
                flag = false;
                break;
            }
        }
        assertTrue("Sort correct", flag);
        System.out.println("List not sort increasing by Date Of Birth.");
        
    }

}
