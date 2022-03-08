package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.regex.Pattern;

public class ValidationForTest {

    public static Scanner in = new Scanner(System.in);

    /**
     * Check if input is String or not
     *
     * @param message
     * @return
     */
    public static String inputString(int max, String mess) {
        String s = "";

        do {
            System.out.print(mess);
            s = in.nextLine();
            if (!s.isEmpty() && s.length() <= max) {
                break;
            } else if (s.length() > max) {
                System.err.println("You must input not longer than " + max + " characters!");
            } else {
                System.err.print("Can't be left blank, enter again.\n");
            }
        } while (true);
        return s;
    }

    /**
     * Check if input is int or not
     *
     * @param min
     * @param max
     * @param value
     * @param message
     * @return
     */
    public static boolean checkInt(int min, int max, String value) {

        try {
            int i = 0;
            if (Integer.parseInt(value) == Integer.parseInt(value)) {
                i = Integer.parseInt(value);
            }
            if (i < min || i > max) {
                System.out.println("You must choose from " + min + " to " + max + "! Re-enter.");
            } else {
                return true;
            }
        } catch (Exception e) {
            System.out.print("You must be enter positive interger number, enter again.\n");
        }
        return false;
    }

    /**
     * Check if input is boolean or not
     *
     * @param p
     * @param message
     * @return
     */
    public static boolean inputBoolean(String p) {
        String tmp;
        boolean b = true;

        do {
            try {
                System.out.print(p);
                tmp = in.nextLine();
                if (Boolean.parseBoolean(tmp.toLowerCase()) == Boolean.parseBoolean(tmp.toLowerCase())) {
                    b = Boolean.parseBoolean(tmp);
                }
                break;
            } catch (Exception e) {
                System.err.print("You must enter TRUE or FALSE! Re-enter.\n");
            }
        } while (true);
        return b;
    }

    /**
     * Check if input date is valid or not
     *
     * @param tmp
     * @param pattern
     * @param message
     * @param format date
     * @return
     */
    public static boolean checkFormatDate(String tmp, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            if (!tmp.isEmpty()) {
                Date date = sdf.parse(tmp);
                if (tmp.equals(sdf.format(date))) {
                    return true;
                } else {
                    System.out.println("Please enter a right date, enter again.");
                }
            } else {
                System.out.println("Not empty! Re-enter.");
            }
        } catch (ParseException e) {
            System.out.println("Format must be " + pattern + " ! Enter again.");
        }
        return false;
    }

    /**
     * Check if input String is letterString or not
     *
     * @param message
     * @return
     */
    public static boolean nameValid(String p) {
        for (int i = 0; i < p.length(); i++) {
            if (!Character.isLetter(p.charAt(i)) && p.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean checkYesNo(String tmp) {
        tmp = tmp.replaceAll("\\s+", "");
        if (tmp.compareToIgnoreCase("yes") == 0 || tmp.compareToIgnoreCase("y") == 0) {
            return true;
        }
        if (tmp.compareToIgnoreCase("no") == 0 || tmp.compareToIgnoreCase("n") == 0) {
            return true;
        }
        System.out.print("You must choose Yes(Y) or No(N)!\n");
        return false;
    }

    public static String checkName(String name) {

        String str = "";
        if (name.isEmpty()) {
            System.out.println("You must enter your name! Re-enter.");
        } else {
            if (nameValid(name)) {
                name = name.replaceAll("\\s+", " ").trim();
                str = str + Character.toUpperCase(name.charAt(0));
                for (int i = 1; i < name.length(); i++) {
                    if (name.charAt(i) == ' ') {
                        str = str + name.charAt(i) + Character.toUpperCase(name.charAt(i + 1));
                        i++;
                    } else {
                        str = str + Character.toLowerCase(name.charAt(i));
                    }
                }
                if (str.length() < 50) {
                    return str;
                } else {
                    System.out.println("Name is not longer than 50 characters! Re-enter");
                }
            } else {
                System.out.println("Name must be letter! Re-enter.");
            }
        }
//        }
        return null;

    }

    public static boolean checkFormatEmail(String email) {
        email = email.replace("\\s+", " ");
        Pattern p = Pattern.compile("^[a-z0-9A-Z]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}+$");
        if (!email.isEmpty()) { // not empty ~> finish
            if (p.matcher(email).find()) {
                return true;
            } else {
                System.out.println("Email must in format "
                        + "Local-Part(name(.name2)@Domain(domain.something(.domain2.domain3))(max 3 '.'), enter again!");
            }
        } else { // empty string ~> display error & re-enter
            System.out.println("Email can not empty, enter again!");
        }

        return false;
    }

    public static boolean checkPhone(String phone) {
        Pattern p = Pattern.compile("^\\d{3}[-|/]\\d{3}[-|/]\\d{4}$");
        if (phone.isEmpty()) {
            System.out.println("Phone number can not empty, enter again: ");
        }
        if (p.matcher(phone).find()) {
            return true;
        } else {
            System.out.println("Mobile is a string of number conforming (000)-000-0000 format. Re-enter!");
        }
        return false;
    }
}
