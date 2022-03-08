package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Validation {

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
     * @param message
     * @return
     */
    public static int inputInt(String p) {
        String tmp;
        int i = 0;

        do {
            System.out.print(p);
            try {
                tmp = in.nextLine();
                if (Integer.parseInt(tmp) == Integer.parseInt(tmp)) {
                    i = Integer.parseInt(tmp);
                }
                break;
            } catch (Exception e) {
                System.err.print("You must be enter positive interger number, enter again.\n");
            }
        } while (true);
        return i;
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
     * @param p
     * @param pattern
     * @param message
     * @param format date
     * @return
     */
    public static Date inputDate(String p, String pattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        Date date = new Date();
        String tmp;
        while (true) {
            try {
                System.out.print(p);
                tmp = in.nextLine();
                if (!tmp.isEmpty()) {
                    date = sdf.parse(tmp);
                    if (tmp.equals(sdf.format(date))) {
                        return date;
                    } else {
                        System.err.println("Please enter a right date, enter again.");
                    }
                } else {
                    System.err.println("Not empty! Re-enter.");
                }
            } catch (Exception e) {
                System.err.println("Format must be " + pattern + " ! Enter again.");
            }
        }
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
        while (true) {
            System.out.print(tmp);
            String s = in.nextLine();
            s = s.replaceAll(" ", "");
            if (s.compareToIgnoreCase("yes") == 0 || s.compareToIgnoreCase("y") == 0) {
                return true;
            }
            if (s.compareToIgnoreCase("no") == 0 || s.compareToIgnoreCase("n") == 0) {
                return false;
            }
            System.err.print("You must choose Yes(Y) or No(N)!\n");
        }
    }

    public static String inputName(String s) {

        String name = "";
        String str = "";
        while (true) {
            System.out.print(s);
            name = in.nextLine();
            if (name.isEmpty()) {
                System.err.println("You must enter your name! Re-enter.");
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
                        System.err.println("Name is not longer than 50 characters! Re-enter");
                    }
                } else {
                    System.err.println("Name must be letter! Re-enter.");
                }
            }
        }
    }

    public static String inputEmail(String s) {
        // loop until have valid name were inputted
        while (true) {
            System.out.print(s);
            String string = in.nextLine().trim();
            string = string.replace("\\s+", " ");
            Pattern p = Pattern.compile("^[a-z0-9A-Z]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}+$");
            if (!string.isEmpty()) { // not empty ~> finish
                if (p.matcher(string).find()) {
                    return string;
                } else {
                    System.err.println("Email must in format "
                            + "Local-Part(name(.name2)@Domain(domain.something(.domain2.domain3))(max 3 '.'), enter again!");
                }
            } else { // empty string ~> display error & re-enter
                System.err.println("Email can not empty, enter again!");
            }
        }
    }

    public static String inputPhone(String mess) {
        Pattern p = Pattern.compile("^\\d{3}[-|/]\\d{3}[-|/]\\d{4}$");
        while (true) {
            System.out.print(mess);
            String phone = in.nextLine();
            if (phone.isEmpty()) {
                System.err.println("Phone number can not empty, enter again: ");
            }
            if (p.matcher(phone).find()) {
                return phone;
            } else {
                System.err.println("Mobile is a string of number conforming (000)-000-0000 format. Re-enter!");
            }
        }
    }
}
