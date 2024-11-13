namespace AWMS.app.Forms.RibbonUser
{
    partial class frmLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLogin));
            txtUserName = new DevExpress.XtraEditors.TextEdit();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            txtPassword = new DevExpress.XtraEditors.TextEdit();
            btnEnter = new DevExpress.XtraEditors.SimpleButton();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            error = new DevExpress.XtraEditors.LabelControl();
            button1 = new Button();
            pictureEdit1 = new DevExpress.XtraEditors.PictureEdit();
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl5 = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)txtUserName.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)txtPassword.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            SuspendLayout();
            // 
            // txtUserName
            // 
            txtUserName.Location = new Point(79, 55);
            txtUserName.Name = "txtUserName";
            txtUserName.Properties.Appearance.Font = new Font("Tahoma", 12.25F, FontStyle.Regular, GraphicsUnit.Point);
            txtUserName.Properties.Appearance.Options.UseFont = true;
            txtUserName.Size = new Size(195, 26);
            txtUserName.TabIndex = 1;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Location = new Point(6, 61);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(67, 14);
            labelControl1.TabIndex = 2;
            labelControl1.Text = "UserName :";
            // 
            // labelControl2
            // 
            labelControl2.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Location = new Point(6, 95);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(68, 14);
            labelControl2.TabIndex = 4;
            labelControl2.Text = "PassWord :";
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(79, 89);
            txtPassword.Name = "txtPassword";
            txtPassword.Properties.Appearance.Font = new Font("Tahoma", 12.25F, FontStyle.Regular, GraphicsUnit.Point);
            txtPassword.Properties.Appearance.Options.UseFont = true;
            txtPassword.Properties.PasswordChar = '*';
            txtPassword.Properties.UseSystemPasswordChar = true;
            txtPassword.Size = new Size(195, 26);
            txtPassword.TabIndex = 3;
            // 
            // btnEnter
            // 
            btnEnter.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnEnter.Appearance.Options.UseFont = true;
            btnEnter.Cursor = Cursors.Hand;
            btnEnter.ImageOptions.Image = Properties.Resources.editrangepermission_32x32;
            btnEnter.Location = new Point(77, 131);
            btnEnter.Name = "btnEnter";
            btnEnter.ShowFocusRectangle = DevExpress.Utils.DefaultBoolean.True;
            btnEnter.Size = new Size(95, 38);
            btnEnter.TabIndex = 5;
            btnEnter.Text = "Enter";
            btnEnter.Click += btnEnter_Click;
            // 
            // simpleButton1
            // 
            simpleButton1.Cursor = Cursors.Hand;
            simpleButton1.ImageOptions.Image = Properties.Resources.clear_32x32;
            simpleButton1.Location = new Point(187, 131);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(85, 38);
            simpleButton1.TabIndex = 6;
            simpleButton1.Text = "Cancel";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // error
            // 
            error.Appearance.Font = new Font("Tahoma", 10.25F, FontStyle.Regular, GraphicsUnit.Point);
            error.Appearance.ForeColor = Color.Red;
            error.Appearance.Options.UseFont = true;
            error.Appearance.Options.UseForeColor = true;
            error.Location = new Point(208, 222);
            error.Name = "error";
            error.Size = new Size(0, 17);
            error.TabIndex = 7;
            // 
            // button1
            // 
            button1.Location = new Point(416, 259);
            button1.Name = "button1";
            button1.Size = new Size(95, 23);
            button1.TabIndex = 8;
            button1.Text = "button1";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // pictureEdit1
            // 
            pictureEdit1.EditValue = resources.GetObject("pictureEdit1.EditValue");
            pictureEdit1.Location = new Point(17, 19);
            pictureEdit1.Name = "pictureEdit1";
            pictureEdit1.Properties.Appearance.BorderColor = Color.FromArgb(255, 128, 0);
            pictureEdit1.Properties.Appearance.Options.UseBorderColor = true;
            pictureEdit1.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            pictureEdit1.Properties.ShowCameraMenuItem = DevExpress.XtraEditors.Controls.CameraMenuItemVisibility.Auto;
            pictureEdit1.Properties.SizeMode = DevExpress.XtraEditors.Controls.PictureSizeMode.Stretch;
            pictureEdit1.Size = new Size(196, 197);
            pictureEdit1.TabIndex = 9;
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(txtPassword);
            panelControl1.Controls.Add(txtUserName);
            panelControl1.Controls.Add(labelControl1);
            panelControl1.Controls.Add(labelControl3);
            panelControl1.Controls.Add(labelControl2);
            panelControl1.Controls.Add(simpleButton1);
            panelControl1.Controls.Add(btnEnter);
            panelControl1.Location = new Point(231, 19);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(280, 197);
            panelControl1.TabIndex = 10;
            // 
            // labelControl3
            // 
            labelControl3.Appearance.Font = new Font("Arial Rounded MT Bold", 12F, FontStyle.Underline, GraphicsUnit.Point);
            labelControl3.Appearance.ForeColor = Color.FromArgb(255, 128, 0);
            labelControl3.Appearance.Options.UseFont = true;
            labelControl3.Appearance.Options.UseForeColor = true;
            labelControl3.LineVisible = true;
            labelControl3.Location = new Point(9, 6);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(44, 18);
            labelControl3.TabIndex = 11;
            labelControl3.Text = "Login";
            // 
            // labelControl4
            // 
            labelControl4.Appearance.ForeColor = Color.Gray;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.Location = new Point(59, 270);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(193, 13);
            labelControl4.TabIndex = 12;
            labelControl4.Text = "Ashina Warehouse Management System";
            // 
            // labelControl5
            // 
            labelControl5.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl5.Appearance.Options.UseFont = true;
            labelControl5.Location = new Point(17, 270);
            labelControl5.Name = "labelControl5";
            labelControl5.Size = new Size(33, 13);
            labelControl5.TabIndex = 13;
            labelControl5.Text = "AWMS";
            // 
            // frmLogin
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(527, 294);
            Controls.Add(labelControl5);
            Controls.Add(labelControl4);
            Controls.Add(button1);
            Controls.Add(panelControl1);
            Controls.Add(pictureEdit1);
            Controls.Add(error);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Image = (Image)resources.GetObject("frmLogin.IconOptions.Image");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmLogin";
            Opacity = 0.9D;
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Ashina WareHouse Login ";
            Load += frmLogin_Load;
            ((System.ComponentModel.ISupportInitialize)txtUserName.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)txtPassword.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            panelControl1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private DevExpress.XtraEditors.TextEdit txtUserName;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.TextEdit txtPassword;
        private DevExpress.XtraEditors.SimpleButton btnEnter;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.LabelControl error;
        private Button button1;
        private DevExpress.XtraEditors.PictureEdit pictureEdit1;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl5;
    }
}