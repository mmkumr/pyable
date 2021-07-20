"""Dashboard page"""
import tkinter as tk
import tkinter.font as tkf

dashboard_frame = 0
groot = 0


class Dashboard():
    """Dashboard app class"""
    def create(self, root):
        """Dashboard page frame"""
        global dashboard_frame
        font = tkf.Font(family='Helvetica', size=10, weight="bold")
        name_font = tkf.Font(family='Z003', size=30, weight="bold")
        dashboard_frame = tk.Frame(root)
        dashboard_frame.pack()
        dashboard_frame.place(in_=root, anchor="c", relx=.5, rely=.5)
        topbar = tk.Frame(dashboard_frame,
                          highlightbackground="black",
                          highlightthickness=1,
                          height=70,
                          width=root.winfo_screenwidth() * 0.9,
                          bg="white")
        topbar.pack(expand=True, fill='both', side=tk.TOP)
        topbar.pack_propagate(0)
        canvas = tk.Canvas(topbar, width=70, bg="white")
        canvas.create_oval(5, 5, 60, 60,
                           outline="black", fill="grey",
                           width=2)
        canvas.pack(side=tk.RIGHT)
        my_account_frame = tk.Frame(topbar)
        my_account_frame.pack(side=tk.RIGHT)
        my_account = tk.Label(my_account_frame, text="My Account", bg="white",
                              font=font)
        my_account.pack(expand=True, fill="both")
        offers_frame = tk.Frame(topbar, bg="white")
        offers_frame.pack(side=tk.RIGHT)
        offers = tk.Button(offers_frame, text="My Offers",
                           bg="#4A90E4",
                           fg="white", height=2)
        offers.pack(padx=10)
        logo_frame = tk.Frame(topbar)
        logo_frame.pack(side=tk.LEFT)
        logo_lbl = tk.Label(logo_frame, text="PYABLE", bg="white",
                            font=name_font, fg="#4A90E4")
        logo_lbl.pack(side='left')
        return dashboard_frame
