package com.edusys.utils;

import java.awt.Component;
import javax.swing.JOptionPane;

public class MsgBox {

    public static void alert(Component parent, String message) {
        JOptionPane.showMessageDialog(parent, message, "Hệ thống quản lý đào tạo", 1);
    }

    public static boolean confirm(Component parent, String message) {
        int result = JOptionPane.showConfirmDialog(parent, message, "Hệ thống quản lý đào tạo", 0, 3);

        return (result == 0);
    }

    public static String prompt(Component parent, String message) {
        return JOptionPane.showInputDialog(parent, message, "Hệ thống quản lý đào tạo", 1);
    }
}
