/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import com.DAO.staffDAO;
import com.DAO.studentDAO;
import com.DAO.hostelDAO;
import com.DAO.meritDAO;
import com.DAO.involvementDAO;
import com.DAO.roomApplicationDAO;
import com.DAO.roomDAO;
import com.DAO.hostelApplicationDAO;
import com.DAO.loginDAO;
import com.DAO.newPasswordDAO;
import com.DAO.userReportDAO;

import com.Model.staff;
import com.Model.student;
import com.Model.hostel;
import com.Model.merit;
import com.Model.involvement;
import com.Model.roomApplication;
import com.Model.room;
import com.Model.hostelApplication;
import com.Model.login;
import com.Model.newPassword;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class CRUDServlet extends HttpServlet {

    private staffDAO staffDAO;
    private studentDAO studentDAO;
    private meritDAO meritDAO;
    private involvementDAO involvementDAO;
    private hostelDAO hostelDAO;
    private roomApplicationDAO applicationDAO;
    private roomDAO roomDAO;
    private hostelApplicationDAO hostelApplicationDAO;
    private newPasswordDAO newPasswordDAO;
    private userReportDAO userReportDAO;

    public void init() {
        staffDAO = new staffDAO();
        studentDAO = new studentDAO();
        meritDAO = new meritDAO();
        involvementDAO = new involvementDAO();
        hostelDAO = new hostelDAO();
        applicationDAO = new roomApplicationDAO();
        roomDAO = new roomDAO();
        hostelApplicationDAO = new hostelApplicationDAO();
        newPasswordDAO = new newPasswordDAO();
        userReportDAO = new userReportDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newStaff":
                    showNewStaffForm(request, response);
                    break;
                case "/insertStaff":
                    insertStaff(request, response);
                    break;
                case "/deleteStaff":
                    deleteStaff(request, response);
                    break;
                case "/editStaff":
                    showEditStaffForm(request, response);
                    break;
                case "/updateStaff":
                    updateStaff(request, response);
                    break;
                case "/staffList":
                    listStaff(request, response);
                    break;
                case "/newStudent":
                    showNewStudentForm(request, response);
                    break;
                case "/insertStudent":
                    insertStudent(request, response);
                    break;
                case "/deleteStudent":
                    deleteStudent(request, response);
                    break;
                case "/editStudent":
                    showEditStudentForm(request, response);
                    break;
                case "/updateStudent":
                    updateStudent(request, response);
                    break;
                case "/studentList":
                    listStudent(request, response);
                    break;
                case "/newMerit":
                    showMeritForm(request, response);
                    break;
                case "/insertMerit":
                    insertMerit(request, response);
                    break;
                case "/deleteMerit":
                    deleteMerit(request, response);
                    break;
                case "/editMerit":
                    showEditMeritForm(request, response);
                    break;
                case "/updateMerit":
                    updateMerit(request, response);
                    break;
                case "/meritList":
                    listMerit(request, response);
                    break;
                case "/newInvolvement":
                    showInvolvementForm(request, response);
                    break;
                case "/involvementListByMeritID":
                    listInvolvementByMeritID(request, response);
                    break;
                case "/involvementListByStudID":
                    listInvolvementByStudID(request, response);
                    break;
                case "/involvementList":
                    listInvolvement(request, response);
                    break;
                case "/insertInvolvement":
                    insertInvolvement(request, response);
                    break;
                case "/editInvolvement":
                    showEditInvolvementForm(request, response);
                    break;
                case "/updateInvolvement":
                    updateInvolvement(request, response);
                    break;
                case "/deleteInvolvement":
                    deleteInvolvement(request, response);
                    break;
                case "/newHostel":
                    showHostelForm(request, response);
                    break;
                case "/insertHostel":
                    insertHostel(request, response);
                    break;
                case "/deleteHostel":
                    deleteHostel(request, response);
                    break;
                case "/editHostel":
                    showEditHostelForm(request, response);
                    break;
                case "/updateHostel":
                    updateHostel(request, response);
                    break;
                case "/hostelList":
                    listHostel(request, response);
                    break;
                case "/newApplication":
                    showNewApplicationForm(request, response);
                    break;
                case "/insertApplication":
                    insertApplication(request, response);
                    break;
                case "/deleteApplication":
                    deleteApplication(request, response);
                    break;
                case "/editApplication":
                    showEditApplicationForm(request, response);
                    break;
                case "/updateApplication":
                    updateApplication(request, response);
                    break;
                case "/applicationList":
                    listApplication(request, response);
                    break;
                case "/newRoom":
                    showNewRoomForm(request, response);
                    break;
                case "/insertRoom":
                    insertRoom(request, response);
                    break;
                case "/deleteRoom":
                    deleteRoom(request, response);
                    break;
                case "/editRoom":
                    showEditRoomForm(request, response);
                    break;
                case "/updateRoom":
                    updateRoom(request, response);
                    break;
                case "/roomList":
                    listRoom(request, response);
                    break;
                case "/newHostelApplication":
                    showNewHostelApplicationForm(request, response);
                    break;
                case "/insertHostelApplication":
                    insertHostelApplication(request, response);
                    break;
                case "/deleteHostelApplication":
                    deleteHostelApplication(request, response);
                    break;
                case "/editHostelApplication":
                    showEditHostelApplicationForm(request, response);
                    break;
                case "/updateHostelApplication":
                    updateHostelApplication(request, response);
                    break;
                case "/updateStatusHostelApplication":
                    updateStatusHostelApplication(request, response);
                    break;
                case "/hostelApplicationList":
                    listHostelApplication(request, response);
                    break;
                case "/showHostelApplicationStatus":
                    showHostelApplicationStatus(request, response);
                    break;
                case "/validateLogin":
                    validateLogin(request, response);
                    break;
                case "/showStaffProfile":
                    showStaffProfile(request, response);
                    break;
                case "/showStaffEditProfileForm":
                    showStaffEditProfileForm(request, response);
                    break;
                case "/updateStaffPersonalInfo":
                    updateStaffPersonalInfo(request, response);
                    break;
                case "/showStudentProfile":
                    showStudentProfile(request, response);
                    break;
                case "/showStudentEditProfileForm":
                    showStudentEditProfileForm(request, response);
                    break;
                case "/updateStudentPersonalInfo":
                    updateStudentPersonalInfo(request, response);
                    break;
                case "/updatePassword":
                    updatePassword(request, response);
                    break;
                case "/updateHostelApplicationAction":
                    updateHostelApplicationAction(request, response);
                    break;
                case "/countAdmin":
                    totalAdmin(request, response);
                    totalStaff(request, response);
                    totalStudent(request, response);
                    break;
                case "/countStaff":
                    totalStaff(request, response);
                    break;
                case "/countStudent":
                    totalStudent(request, response);
                    break;
                case "/countHostel":
                    totalHostel(request, response);
                    break;
                case "/countRoom":
                    totalRoom(request, response);
                    break;
                case "/maxMerit":
                    maxMerit(request, response);
                    minMerit(request, response);
                    break;
                case "/countHostelApplication":
                    totalHostelApplication(request, response);
                    totalRoomApplication(request, response);
                    break;
                case "/offerLetter":
                    offerLetter(request, response);
                    break;
                default:
                    response.sendRedirect("error.jsp");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void validateLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        boolean access = false;
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        login login = new login(name, password);
        if (type.equals("admin")) {
            access = loginDAO.validateAdmin(login);
            if (access == true) {
                request.setAttribute("user", name);
                RequestDispatcher dispatcher = request.getRequestDispatcher("staffHomePage.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("loginInterface.jsp");
            }
        } else if (type.equals("staff")) {
            access = loginDAO.validateStaff(login);
            if (access == true) {
                request.setAttribute("user", name);
                RequestDispatcher dispatcher = request.getRequestDispatcher("staffHomePage.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("loginInterface.jsp");
            }
        } else {
            access = loginDAO.validateStudent(login);
            if (access == true) {
                String studID = request.getParameter("name");
                int count = hostelApplicationDAO.selectOnlyHostelStatusByID(studID);
                int roomApplication = applicationDAO.selectRoomApplicationCountByID(studID);
        
                if (count > 0) {
                    String action = hostelApplicationDAO.selectOnlyActionByID(studID);
                    request.setAttribute("action", action);
                }
                request.setAttribute("count", count);
                request.setAttribute("user", name);
                request.setAttribute("roomApplication", roomApplication);
                RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelPage.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("loginInterface.jsp");
            }
        }
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        boolean status;
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String newPassword = request.getParameter("newpassword");
        String oldPassword = request.getParameter("OldPassword");
        newPassword updatePassword = new newPassword(name, newPassword, oldPassword);

        if (type.equals("admin")) {
            status = newPasswordDAO.updateAdminPassword(updatePassword);
            request.setAttribute("status", status);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePasswordForm.jsp");
            dispatcher.forward(request, response);
        } else if (type.equals("staff")) {
            status = newPasswordDAO.updateStaffPassword(updatePassword);
            request.setAttribute("status", status);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePasswordForm.jsp");
            dispatcher.forward(request, response);
        } else {
            status = newPasswordDAO.updateStudentPassword(updatePassword);
            request.setAttribute("status", status);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePasswordForm.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showStaffEditProfileForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String staffID = request.getParameter("staffID");
        staff existingStaff = staffDAO.selectStaff(staffID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffEditProfileForm.jsp");
        request.setAttribute("staff", existingStaff);
        dispatcher.forward(request, response);
    }

    private void showStaffProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String staffID = request.getParameter("staffID");
        staff existingStaff = staffDAO.selectStaff(staffID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffProfile.jsp");
        request.setAttribute("staff", existingStaff);
        dispatcher.forward(request, response);
    }

    private void updateStaffPersonalInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String staffID = request.getParameter("staffid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String email = request.getParameter("email");
        String hpNo = request.getParameter("hpNo");

        staff staff = new staff(staffID, name, icno, email, hpNo);
        staffDAO.updateStaffProfile(staff);
        response.sendRedirect("showStaffProfile?staffID=" + staffID);
    }

    private void showStudentEditProfileForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String studID = request.getParameter("studID");
        student existingStudent = studentDAO.selectStudent(studID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studEditProfileForm.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }

    private void showStudentProfile(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String studID = request.getParameter("studID");
        student existingStudent = studentDAO.selectStudent(studID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studProfile.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }

    private void updateStudentPersonalInfo(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String studID = request.getParameter("studid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String course = request.getParameter("course");
        String email = request.getParameter("email");
        String hpNo = request.getParameter("hpNo");

        student student = new student(studID, name, icno, course, email, hpNo);
        studentDAO.updateStudentProfile(student);
        response.sendRedirect("showStudentProfile?studID=" + studID);
    }

    private void listStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< staff> listStaff = staffDAO.selectAllStaff();
        request.setAttribute("listStaff", listStaff);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStaffList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewStaffForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStaffForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditStaffForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String staffID = request.getParameter("staffID");
        staff existingStaff = staffDAO.selectStaff(staffID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStaffForm.jsp");
        request.setAttribute("staff", existingStaff);
        dispatcher.forward(request, response);
    }

    private void insertStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String staffID = request.getParameter("staffid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String email = request.getParameter("email");
        String hpNo = request.getParameter("hpNo");
        String password = request.getParameter("password");
        staff newStaff = new staff(staffID, name, icno, email, hpNo, password);
        staffDAO.insertStaff(newStaff);
        response.sendRedirect("staffList");
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String staffID = request.getParameter("staffid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String email = request.getParameter("email");
        String hpNo = request.getParameter("hpNo");
        String password = request.getParameter("password");

        staff staff = new staff(staffID, name, icno, email, hpNo, password);
        staffDAO.updateStaff(staff);
        response.sendRedirect("staffList");
    }

    private void deleteStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String staffID = request.getParameter("staffID");
        staffDAO.deleteStaff(staffID);
        response.sendRedirect("staffList");
    }

    private void listStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< student> listStudent = studentDAO.selectAllStudent();
        request.setAttribute("listStudent", listStudent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStudentList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewStudentForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStudentForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditStudentForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String studID = request.getParameter("studID");
        student existingStudent = studentDAO.selectStudent(studID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffStudentForm.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }

    private void insertStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studid = request.getParameter("studid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String course = request.getParameter("course");
        String email = request.getParameter("email");
        String hpno = request.getParameter("hpno");
        String password = request.getParameter("password");
        student newStudent = new student(studid, name, icno, course, email, hpno, password);
        studentDAO.insertStudent(newStudent);
        response.sendRedirect("studentList");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studid = request.getParameter("studid");
        String name = request.getParameter("name");
        String icno = request.getParameter("icno");
        String course = request.getParameter("course");
        String email = request.getParameter("email");
        String hpno = request.getParameter("hpno");
        String password = request.getParameter("password");

        student student = new student(studid, name, icno, course, email, hpno, password);
        studentDAO.updateStudent(student);
        response.sendRedirect("studentList");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        studentDAO.deleteStudent(studID);
        response.sendRedirect("studentList");
    }
    ///////////////////////////////

    //Display list of hostels method
    private void listMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< merit> listMerit = meritDAO.selectAllMerits();
        request.setAttribute("listMerit", listMerit);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffMeritList.jsp");
        dispatcher.forward(request, response);
    }

    //Display new form method
    private void showMeritForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffMeritForm.jsp");
        dispatcher.forward(request, response);
    }

    //Display edit form method
    private void showEditMeritForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String meritID = request.getParameter("meritID");
        merit existingMerit = meritDAO.selectMerit(meritID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffMeritForm.jsp");
        request.setAttribute("merit", existingMerit);
        dispatcher.forward(request, response);
    }

    //Add new hostel method
    private void insertMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String meritID = request.getParameter("meritID");
        String meritDesc = request.getParameter("meritDesc");
        String category = request.getParameter("category");
        String semester = request.getParameter("semester");
        Date date = Date.valueOf(request.getParameter("date"));
        merit newMerit = new merit(meritID, meritDesc, category, semester, date);
        meritDAO.insertMerit(newMerit);
        response.sendRedirect("meritList");
    }

    //Edit existing hostel method
    private void updateMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String meritID = request.getParameter("meritID");
        String meritDesc = request.getParameter("meritDesc");
        String category = request.getParameter("category");
        String semester = request.getParameter("semester");
        Date date = Date.valueOf(request.getParameter("date"));

        merit merits = new merit(meritID, meritDesc, category, semester, date);
        meritDAO.updateMerit(merits);
        response.sendRedirect("meritList");
    }

    //Delete existing hostel method
    private void deleteMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String meritID = request.getParameter("meritID");
        meritDAO.deleteMerit(meritID);
        response.sendRedirect("meritList");
    }

    private void listInvolvementByMeritID(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String meritID = request.getParameter("meritID");
        List< involvement> listInvolvement = involvementDAO.selectInvolvementByMeritID(meritID);
        request.setAttribute("listInvolvement", listInvolvement);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffInvolvementList.jsp");
        dispatcher.forward(request, response);
    }

    private void listInvolvementByStudID(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String studID = request.getParameter("studID");
        List< involvement> listInvolvement = involvementDAO.selectInvolvementByStudID(studID);
        request.setAttribute("listInvolvement", listInvolvement);
        int totalMerit = involvementDAO.totalMerit(studID);
        request.setAttribute("totalMerit", totalMerit);
        int targetMerit = involvementDAO.targetMerit();
        request.setAttribute("targetMerit", targetMerit);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studInvolvementList.jsp");
        dispatcher.forward(request, response);
    }

    private void listInvolvement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< involvement> listInvolvement = involvementDAO.selectAllInvolvements();
        request.setAttribute("listInvolvement", listInvolvement);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffInvolvementList.jsp");
        dispatcher.forward(request, response);
    }

    private void showInvolvementForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String meritID = request.getParameter("meritID");
        merit existingMerit = meritDAO.selectMerit(meritID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffInvolvementForm.jsp");
        request.setAttribute("merit", existingMerit);
        dispatcher.forward(request, response);
    }

    private void showEditInvolvementForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String studID = request.getParameter("studID");
        String meritID = request.getParameter("meritID");
        involvement existingInvolvement = involvementDAO.selectInvolvement(studID, meritID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffInvolvementForm.jsp");
        request.setAttribute("involvement", existingInvolvement);
        dispatcher.forward(request, response);
    }

    private void insertInvolvement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        String meritID = request.getParameter("meritID");
        String role = request.getParameter("role");
        int merit = Integer.parseInt(request.getParameter("merit"));
        String category = request.getParameter("category");
        involvement newInvolvement = new involvement(studID, meritID, role, merit);
        involvementDAO.insertInvolvement(newInvolvement);
        response.sendRedirect("involvementListByMeritID?meritID=" + meritID + "&category=" + category);
    }

    private void updateInvolvement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String role = request.getParameter("role");
        int merit = Integer.parseInt(request.getParameter("merit"));
        String studID = request.getParameter("studID");
        String meritID = request.getParameter("meritID");
        String category = request.getParameter("category");

        involvement involvements = new involvement(studID, meritID, role, merit);
        involvementDAO.updateInvolvement(involvements);
        response.sendRedirect("involvementListByMeritID?meritID=" + meritID + "&category=" + category);
    }

    private void deleteInvolvement(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        String meritID = request.getParameter("meritID");
        String category = request.getParameter("category");
        involvementDAO.deleteInvolvement(studID, meritID);
        response.sendRedirect("involvementListByMeritID?meritID=" + meritID + "&category=" + category);
    }

    //Display list of hostels method
    private void listHostel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< hostel> listHostel = hostelDAO.selectAllHostels();
        request.setAttribute("listHostel", listHostel);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffHostelList.jsp");
        dispatcher.forward(request, response);
    }

    //Display new form method
    private void showHostelForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffHostelForm.jsp");
        dispatcher.forward(request, response);
    }

    //Display edit form method
    private void showEditHostelForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String hostelID = request.getParameter("hostelID");
        hostel existingHostel = hostelDAO.selectHostel(hostelID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffHostelForm.jsp");
        request.setAttribute("hostel", existingHostel);
        dispatcher.forward(request, response);
    }

    //Add new hostel method
    private void insertHostel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String hostelID = request.getParameter("hostelID");
        String hostelDesc = request.getParameter("hostelDesc");
        int noOfRoom = Integer.parseInt(request.getParameter("noOfRoom"));
        String staffID = request.getParameter("staffID");
        hostel newHostel = new hostel(hostelID, hostelDesc, noOfRoom, staffID);
        hostelDAO.insertHostel(newHostel);
        response.sendRedirect("hostelList");
    }

    //Edit existing hostel method
    private void updateHostel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String hostelID = request.getParameter("hostelID");
        String hostelDesc = request.getParameter("hostelDesc");
        int noOfRoom = Integer.parseInt(request.getParameter("noOfRoom"));
        String staffID = request.getParameter("staffID");

        hostel hostel = new hostel(hostelID, hostelDesc, noOfRoom, staffID);
        hostelDAO.updateHostel(hostel);
        response.sendRedirect("hostelList");
    }

    //Delete existing hostel method
    private void deleteHostel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String hostelID = request.getParameter("hostelID");
        hostelDAO.deleteHostel(hostelID);
        response.sendRedirect("hostelList");
    }

    private void listApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<roomApplication> listApplication = applicationDAO.selectAllApplication();
        request.setAttribute("listApplication", listApplication);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffApplicationList.jsp");

        dispatcher.forward(request, response);
    }

    //Display new form method
    private void showNewApplicationForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffApplicationForm.jsp");
        dispatcher.forward(request, response);
    }

    //Display edit form method
    private void showEditApplicationForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String studID = request.getParameter("studID");
        roomApplication existingApplication = applicationDAO.selectApplication(studID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffApplicationForm.jsp");
        request.setAttribute("application", existingApplication);
        dispatcher.forward(request, response);
    }

    //Add new car method
    private void insertApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String user = request.getParameter("user");
        String studID = request.getParameter("studID");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String block = request.getParameter("block");
        int blockLevel = Integer.parseInt(request.getParameter("blockLevel"));
        String roomType = request.getParameter("roomType");
        String roomNo = request.getParameter("roomNo");
        String stuRequire = request.getParameter("stuRequire");

        roomApplication newApplication = new roomApplication(studID, startDate, endDate, block, blockLevel, roomType, roomNo, stuRequire);
        applicationDAO.insertApplication(newApplication);
        if (user.equals("student")) {
            response.sendRedirect("offerLetter?studID=" + studID);
        } else {
            response.sendRedirect("applicationList");
        }

    }

    private void offerLetter(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String studID = request.getParameter("studID");
        
        hostelApplication status = hostelApplicationDAO.selectHostelStatusByID(studID);
        
        roomApplication applicationn = applicationDAO.selectApplication(studID);
        
        int roomApplication = applicationDAO.selectRoomApplicationCountByID(studID);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("studRoomStatus.jsp");
        request.setAttribute("status", status);
        request.setAttribute("applicationn", applicationn);
        request.setAttribute("roomApplication", roomApplication);
        dispatcher.forward(request, response);
    }

    //Edit existing car method
    private void updateApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String block = request.getParameter("block");
        int blockLevel = Integer.parseInt(request.getParameter("blockLevel"));
        String roomType = request.getParameter("roomType");
        String roomNo = request.getParameter("roomNo");
        String stuRequire = request.getParameter("stuRequire");

        roomApplication application = new roomApplication(studID, startDate, endDate, block, blockLevel, roomType, roomNo, stuRequire);
        applicationDAO.updateApplication(application);
        response.sendRedirect("applicationList");
    }

    //Delete existing car method
    private void deleteApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        applicationDAO.deleteApplication(studID);
        response.sendRedirect("applicationList");
    }

    //////////////////////////////
    //Display list of rooms method
    private void listRoom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<room> listRoom = roomDAO.selectAllRoom();
        request.setAttribute("roomList", listRoom);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffRoomList.jsp");

        dispatcher.forward(request, response);
    }

    //Display list of hostelApplications method
    private void listHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<hostelApplication> listHostelApplication = hostelApplicationDAO.selectAllHostelApplication();
        request.setAttribute("hostelApplicationList", listHostelApplication);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffHostelApplicationList.jsp");

        dispatcher.forward(request, response);
    }

    //Display new room form method
    private void showNewRoomForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffRoomForm.jsp");
        dispatcher.forward(request, response);
    }

    //Display new HostelApplication form method
    private void showNewHostelApplicationForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelApplication.jsp");
        dispatcher.forward(request, response);
    }

    //Display edit room form method
    private void showEditRoomForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String roomID = request.getParameter("roomID");
        room existingRoom = roomDAO.selectRoom(roomID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffRoomForm.jsp");
        request.setAttribute("room", existingRoom);
        dispatcher.forward(request, response);
    }

    //Display edit HostelApplication form method
    private void showEditHostelApplicationForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String studID = request.getParameter("studID");
        hostelApplication existingHostelApplication = hostelApplicationDAO.selectHostelApplication(studID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("staffHostelApplicationForm.jsp");
        request.setAttribute("hostelApplication", existingHostelApplication);
        dispatcher.forward(request, response);
    }

    //Add new room method
    private void insertRoom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String roomID = request.getParameter("roomID");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        double feesPerNight = Double.parseDouble(request.getParameter("feesPerNight"));
        String hostelID = request.getParameter("hostelID");

        room newRoom = new room(roomID, capacity, feesPerNight, hostelID);
        roomDAO.insertRoom(newRoom);
        response.sendRedirect("roomList");

    }

    //Add new hostelApplication method
    private void insertHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String studID = request.getParameter("studID");
        String condition = request.getParameter("condition");
        int merit = involvementDAO.totalMerit(studID);

        hostelApplication newHostelApplication = new hostelApplication(studID, condition, merit);
        hostelApplicationDAO.insertHostelApplication(newHostelApplication);

        int count = hostelApplicationDAO.selectOnlyHostelStatusByID(studID);
        request.setAttribute("count", count);
        String action = hostelApplicationDAO.selectOnlyActionByID(studID);
        request.setAttribute("action", action);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelPage.jsp");
        dispatcher.forward(request, response);

    }

    //Edit existing room method
    private void updateRoom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String roomID = request.getParameter("roomID");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        double feesPerNight = Double.parseDouble(request.getParameter("feesPerNight"));
        String hostelID = request.getParameter("hostelID");

        room newRoom = new room(roomID, capacity, feesPerNight, hostelID);
        roomDAO.updateRoom(newRoom);
        response.sendRedirect("roomList");
    }

    //Edit existing hostelApplication method
    private void updateHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String studID = request.getParameter("studID");
        String condition = request.getParameter("condition");
        int merit = Integer.parseInt(request.getParameter("merit"));
        String status = request.getParameter("status");
        String action = request.getParameter("action");

        hostelApplication hostelApplication = new hostelApplication(studID, condition, merit, status, action);
        hostelApplicationDAO.updateHostelApplication(hostelApplication);
        response.sendRedirect("hostelApplicationList");
    }

    //Delete existing room method
    private void deleteRoom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String roomID = request.getParameter("roomID");
        roomDAO.deleteRoom(roomID);
        response.sendRedirect("roomList");
    }

    //Delete existing hostelApplication method
    private void deleteHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String studID = request.getParameter("studID");
        hostelApplicationDAO.deleteHostelApplication(studID);
        response.sendRedirect("hostelApplicationList");
    }

    private void updateStatusHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        int limit = Integer.parseInt(request.getParameter("limit"));
        hostelApplicationDAO.updateStatusHostelApplication(limit);
        response.sendRedirect("hostelApplicationList");
    }

    private void showOnlyHostelApplicationStatus(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String studID = request.getParameter("studID");
        int count = hostelApplicationDAO.selectOnlyHostelStatusByID(studID);
        request.setAttribute("count", count);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelPage.jsp");
        dispatcher.forward(request, response);
    }

    private void showHostelApplicationStatus(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String studID = request.getParameter("studID");
        hostelApplication status = hostelApplicationDAO.selectHostelStatusByID(studID);
        request.setAttribute("status", status);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelStatus.jsp");
        dispatcher.forward(request, response);
    }

    private void updateHostelApplicationAction(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String studID = request.getParameter("studID");
        String act = request.getParameter("action");
        String action = null;
        boolean updated = hostelApplicationDAO.updateHostelApplicationAction(studID, act);
        if (updated) {
            action = hostelApplicationDAO.selectOnlyActionByID(studID);
        }
        request.setAttribute("action", action);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studHostelPage.jsp");
        dispatcher.forward(request, response);
    }

    private void totalAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int number = userReportDAO.totalAdmin();
        RequestDispatcher dispatcher = request.getRequestDispatcher("userReport.jsp");
        request.setAttribute("number", number);

        int staffNumber = userReportDAO.totalStaff();
        request.setAttribute("staffNumber", staffNumber);

        int studentNumber = userReportDAO.totalStudent();
        request.setAttribute("studentNumber", studentNumber);
        dispatcher.forward(request, response);
    }

    private void totalStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int staffNumber = userReportDAO.totalStaff();
        RequestDispatcher dispatcher = request.getRequestDispatcher("userReport.jsp");
        request.setAttribute("staffNumber", staffNumber);
        dispatcher.forward(request, response);
    }

    private void totalStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int studentNumber = userReportDAO.totalStudent();
        RequestDispatcher dispatcher = request.getRequestDispatcher("userReport.jsp");
        request.setAttribute("studentNumber", studentNumber);
        dispatcher.forward(request, response);
    }

    private void totalHostel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int hostelNumber = userReportDAO.totalHostel();
        request.setAttribute("hostelNumber", hostelNumber);
        RequestDispatcher dispatcher = request.getRequestDispatcher("hostelReport.jsp");

        dispatcher.forward(request, response);
    }

    private void totalRoom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int roomNumber = userReportDAO.totalRoom();
        RequestDispatcher dispatcher = request.getRequestDispatcher("roomReport.jsp");
        request.setAttribute("roomNumber", roomNumber);
        dispatcher.forward(request, response);
    }

    private void maxMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int maxMerit = userReportDAO.maxMerit();
        RequestDispatcher dispatcher = request.getRequestDispatcher("meritReport.jsp");
        request.setAttribute("maxMerit", maxMerit);

        int minMerit = userReportDAO.minMerit();
        request.setAttribute("minMerit", minMerit);
        dispatcher.forward(request, response);
    }

    private void minMerit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int minMerit = userReportDAO.minMerit();
        RequestDispatcher dispatcher = request.getRequestDispatcher("meritReport.jsp");
        request.setAttribute("minMerit", minMerit);
        dispatcher.forward(request, response);
    }

    private void totalHostelApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int totalHostelApplication = userReportDAO.totalHostelApplication();
        RequestDispatcher dispatcher = request.getRequestDispatcher("applicationReport.jsp");
        request.setAttribute("totalHostelApplication", totalHostelApplication);

        int totalRoomApplication = userReportDAO.totalRoomApplication();
        request.setAttribute("totalRoomApplication", totalRoomApplication);
    }

    private void totalRoomApplication(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int totalRoomApplication = userReportDAO.totalRoomApplication();
        RequestDispatcher dispatcher = request.getRequestDispatcher("applicationReport.jsp");
        request.setAttribute("totalRoomApplication", totalRoomApplication);
        dispatcher.forward(request, response);
    }

}
