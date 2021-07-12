"""Login Page File"""
import tkinter as tk
import tkinter.font as tkf
import fontawesome as fa
import contact


login_frame = 0
groot = 0


class Login():
    """Login class of the app"""
    def create(self, root):
        """Login page frame"""
        global login_frame
        global groot
        groot = root
        font = tkf.Font(family='Helvetica', size=20, weight="normal")
        title_font = tkf.Font(family='Helvetica', size=50, weight="bold",
                              underline=True)
        tagline_font = tkf.Font(family='Helvetica', size=10, weight="normal")
        login_frame = tk.Frame(root)
        login_frame.pack()
        login_frame.place(in_=root, anchor="c", relx=.5, rely=.5)
        # Left frame
        login_left = tk.Frame(login_frame, height=root.winfo_screenheight() * 0.7,
                              width=root.winfo_screenwidth() * 0.5, bg="#436980")
        login_left.pack(expand=True, fill='both', side=tk.LEFT)
        login_left.pack_propagate(0)
        login_right = tk.Frame(login_frame, height=root.winfo_screenheight() * 0.7,
                               width=root.winfo_screenwidth() * 0.25, bg="white")
        login_right.pack(expand=True, fill='both', side=tk.RIGHT)
        login_right.pack_propagate(0)
        title = tk.Label(login_left, bg="#436980", fg="yellow", text="Login",
                         font=title_font)
        title.pack(pady=40)
        # Email section
        email_frame = tk.Frame(login_left, bg="#436980")
        email_frame.pack(pady=20)
        email_label = tk.Label(email_frame, bg="#436980", fg="white",
                               text=fa.icons['users'] + "Username",
                               font=font)
        email_label.pack(padx=40, side=tk.LEFT)
        email__entry = tk.Entry(email_frame, width=20, font=font)
        email__entry.pack(side=tk.RIGHT)
        # Password section
        password_frame = tk.Frame(login_left, bg="#436980")
        password_frame.pack(pady=20)
        password_label = tk.Label(password_frame, bg="#436980", fg="white",
                                  text=fa.icons['key'] + "Password",
                                  font=font)
        password_label.pack(padx=45, side=tk.LEFT)
        password__entry = tk.Entry(password_frame, width=20, font=font)
        password__entry.config(show="*")
        password__entry.pack(side=tk.RIGHT)
        submit_btn = tk.Button(login_left, text="Submit", bg="green",
                               fg="white", font=font)
        submit_btn.pack()
        login_left.pack(expand=True, fill='both', side=tk.LEFT)
        login_left.pack_propagate(0)
        tagline_label = tk.Label(login_right, bg="white", fg="#436980",
                                 text="Spend money not time\nwith\nPyable",
                                 font=tagline_font)
        tagline_label.pack(padx=40, side=tk.BOTTOM)
        contactus_btn = tk.Button(login_right, text="Contact Us", bg="#F06927",
                                  fg="white", font=font, command=contactpage)
        contactus_btn.pack()
        contactus_btn.place(in_=login_right, anchor="c", relx=.5, rely=.5)
        return login_frame

    def destroy(self):
        """destroying the login frame"""
        global login_frame
        login_frame.destroy()


def contactpage():
    """Navigator function for signup page"""
    global groot
    temp = Login()
    temp.destroy()
    temp = contact.Contact()
    temp.create(groot).tkraise()
