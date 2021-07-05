"""signup Page File"""
import tkinter as tk
import tkinter.font as tkf
import fontawesome as fa
import login

signup_frame = 1


class Signup():
    """signup class of the app"""

    def create(self, root):
        """signup page frame"""
        global signup_frame
        font = tkf.Font(family='Helvetica', size=20, weight="normal")
        title_font = tkf.Font(family='Helvetica', size=50, weight="bold",
                              underline=True)
        signup_frame = tk.Frame(root)
        signup_frame.pack()
        signup_frame.place(in_=root, anchor="c", relx=.5, rely=.5)
        # Left frame
        signup_left = tk.Frame(signup_frame, height=root.winfo_screenheight() * 0.7,
                               width=root.winfo_screenwidth() * 0.5, bg="#436980")
        signup_left.pack(expand=True, fill='both', side=tk.LEFT)
        signup_left.pack_propagate(0)
        signup_right = tk.Frame(signup_frame, height=root.winfo_screenheight() * 0.7,
                                width=root.winfo_screenwidth() * 0.25, bg="white")
        signup_right.pack(expand=True, fill='both', side=tk.RIGHT)
        signup_right.pack_propagate(0)
        title = tk.Label(signup_left, bg="#436980", fg="yellow", text="Signup",
                         font=title_font)
        title.pack(pady=40)
        # Email section
        email_frame = tk.Frame(signup_left, bg="#436980")
        email_frame.pack(pady=20)
        email_label = tk.Label(email_frame, bg="#436980", fg="white",
                               text=fa.icons['users'] + "Username",
                               font=font)
        email_label.pack(padx=40, side=tk.LEFT)
        email__entry = tk.Entry(email_frame, width=20, font=font)
        email__entry.pack(side=tk.RIGHT)
        # Password section
        password_frame = tk.Frame(signup_left, bg="#436980")
        password_frame.pack(pady=20)
        password_label = tk.Label(password_frame, bg="#436980", fg="white",
                                  text=fa.icons['key'] + "Password",
                                  font=font)
        password_label.pack(padx=45, side=tk.LEFT)
        password__entry = tk.Entry(password_frame, width=20, font=font)
        password__entry.config(show="*")
        password__entry.pack(side=tk.RIGHT)
        submit_btn = tk.Button(signup_left, text="Submit", bg="green",
                               fg="white", font=font)
        submit_btn.pack()
        login_btn = tk.Button(signup_right, text="Login", bg="#3B75BE",
                              fg="white", font=font, command=loginpage)
        login_btn.pack()
        login_btn.place(in_=signup_right, anchor="c", relx=.5, rely=.5)
        contactus_btn = tk.Button(signup_right, text="Contact Us", bg="#F06927",
                                  fg="white", font=font)
        contactus_btn.pack()
        contactus_btn.place(in_=signup_right, anchor="c", relx=.5, rely=.6)
        return signup_frame

    def destroy(self):
        """destroying the signup frame"""
        global signup_frame
        signup_frame.destroy()


def loginpage():
    """Navigator function for signup page"""
    temp = Signup()
    temp.destroy()
    temp = login.Login()
    temp.create(login.groot).tkraise()
