"""Contact us Page File"""
import tkinter as tk
import tkinter.font as tkf
import webbrowser
import login
import fontawesome as fa


Contact_frame = 0
groot = 0


class Contact():
    """Contact class of the app"""
    def create(self, root):
        """Contact page frame"""
        global Contact_frame
        global groot
        groot = root
        font = tkf.Font(family='Helvetica', size=20, weight="normal")
        title_font = tkf.Font(family='Helvetica', size=50, weight="bold",
                              underline=True)
        link_font = tkf.Font(family='Helvetica', size=20, weight="normal")
        Contact_frame = tk.Frame(root)
        Contact_frame.pack()
        Contact_frame.place(in_=root, anchor="c", relx=.5, rely=.5)
        # Left frame
        Contact_left = tk.Frame(Contact_frame,
                                height=root.winfo_screenheight() * 0.7,
                                width=root.winfo_screenwidth() * 0.5,
                                bg="#436980")
        Contact_left.pack(expand=True, fill='both', side=tk.LEFT)
        Contact_left.pack_propagate(0)
        Contact_right = tk.Frame(Contact_frame, height=root.winfo_screenheight() * 0.7,
                                 width=root.winfo_screenwidth() * 0.25, bg="white")
        Contact_right.pack(expand=True, fill='both', side=tk.RIGHT)
        Contact_right.pack_propagate(0)
        title = tk.Label(Contact_left, bg="#436980", fg="yellow", text="Contact Us",
                         font=title_font)
        title.pack(pady=40)
        # Email section
        email_frame = tk.Frame(Contact_left, bg="#436980")
        email_frame.pack(pady=20, anchor="c")
        email_label = tk.Label(email_frame, bg="#436980", fg="white",
                               text="E-mail",
                               font=font)
        email_label.pack(padx=40, side=tk.LEFT)
        email__entry = tk.Entry(email_frame, width=20, font=font)
        email__entry.pack(side=tk.RIGHT)
        # Password section
        subject_frame = tk.Frame(Contact_left, bg="#436980")
        subject_frame.pack(pady=20, anchor="c")
        subject_label = tk.Label(subject_frame, bg="#436980", fg="white",
                                 text="Subject",
                                 font=font)
        subject_label.pack(padx=45, side=tk.LEFT)
        subject_label = tk.Entry(subject_frame, width=20, font=font)
        subject_label.pack(side=tk.RIGHT)
        body_frame = tk.Frame(Contact_left, bg="#436980")
        body_frame.pack(pady=20, anchor="c")
        body_label = tk.Label(body_frame, bg="#436980", fg="white",
                              text="Body",
                              font=font)
        body_label.pack(padx=45, side=tk.LEFT)
        body_label = tk.Text(body_frame, font=font, height=4, width=20)
        body_label.pack(side=tk.RIGHT)
        submit_btn = tk.Button(Contact_left, text="Submit", bg="green",
                               fg="white", font=font)
        submit_btn.pack()
        Contact_left.pack(expand=True, fill='both', side=tk.LEFT)
        Contact_left.pack_propagate(0)
        links_frame = tk.Frame(Contact_right, bg="white")
        links_frame.pack(side=tk.BOTTOM)
        website = tk.Label(links_frame, bg='white', fg="#436980",
                           text=fa.icons["globe"] + "www.pyable.com",
                           font=link_font)
        website.pack(pady=10)
        website.bind("<Button-1>",
                     lambda e: webbrowser.open_new("http://www.pyable.com"))
        email_contact = tk.Label(links_frame, bg='white', fg="#436980",
                                 text=fa.icons["envelope"] + "ceo@pyable.com",
                                 font=link_font)
        email_contact.pack(pady=10)
        contactus_btn = tk.Button(Contact_right, text="Back", bg="#F06927",
                                  fg="white", font=font, command=loginpage)
        contactus_btn.pack()
        contactus_btn.place(in_=Contact_right, anchor="c", relx=.5, rely=.5)
        return Contact_frame

    def destroy(self):
        """destroying the Contact frame"""
        global Contact_frame
        Contact_frame.destroy()


def loginpage():
    """Navigator function for signup page"""
    global groot
    temp = Contact()
    temp.destroy()
    temp = login.Login()
    temp.create(groot).tkraise()
