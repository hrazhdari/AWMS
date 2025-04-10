namespace AWMS.app.Forms.RibbonUser
{
    partial class frmAddUser
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddUser));
            txtUserName = new DevExpress.XtraEditors.TextEdit();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            txtPassword = new DevExpress.XtraEditors.TextEdit();
            btnAddUser = new DevExpress.XtraEditors.SimpleButton();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            pictureEdit1 = new DevExpress.XtraEditors.PictureEdit();
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            labelControl6 = new DevExpress.XtraEditors.LabelControl();
            LookupRole = new DevExpress.XtraEditors.LookUpEdit();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl5 = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)txtUserName.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)txtPassword.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)pictureEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)LookupRole.Properties).BeginInit();
            SuspendLayout();
            // 
            // txtUserName
            // 
            txtUserName.Location = new Point(81, 55);
            txtUserName.Name = "txtUserName";
            txtUserName.Properties.Appearance.Font = new Font("Tahoma", 12.25F, FontStyle.Regular, GraphicsUnit.Point);
            txtUserName.Properties.Appearance.Options.UseFont = true;
            txtUserName.Size = new Size(260, 26);
            txtUserName.TabIndex = 1;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Location = new Point(7, 61);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(67, 14);
            labelControl1.TabIndex = 2;
            labelControl1.Text = "UserName :";
            // 
            // labelControl2
            // 
            labelControl2.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Location = new Point(7, 95);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(68, 14);
            labelControl2.TabIndex = 4;
            labelControl2.Text = "PassWord :";
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(81, 89);
            txtPassword.Name = "txtPassword";
            txtPassword.Properties.Appearance.Font = new Font("Tahoma", 12.25F, FontStyle.Regular, GraphicsUnit.Point);
            txtPassword.Properties.Appearance.Options.UseFont = true;
            txtPassword.Properties.PasswordChar = '*';
            txtPassword.Properties.UseSystemPasswordChar = true;
            txtPassword.Size = new Size(260, 26);
            txtPassword.TabIndex = 3;
            // 
            // btnAddUser
            // 
            btnAddUser.Appearance.BackColor = Color.FromArgb(192, 255, 192);
            btnAddUser.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnAddUser.Appearance.Options.UseBackColor = true;
            btnAddUser.Appearance.Options.UseFont = true;
            btnAddUser.Cursor = Cursors.Hand;
            btnAddUser.ImageOptions.Image = (Image)resources.GetObject("btnAddUser.ImageOptions.Image");
            btnAddUser.Location = new Point(81, 207);
            btnAddUser.Name = "btnAddUser";
            btnAddUser.ShowFocusRectangle = DevExpress.Utils.DefaultBoolean.True;
            btnAddUser.Size = new Size(124, 38);
            btnAddUser.TabIndex = 5;
            btnAddUser.Text = "Add User";
            btnAddUser.Click += btnAddUser_Click;
            // 
            // simpleButton1
            // 
            simpleButton1.Appearance.BackColor = Color.FromArgb(192, 255, 255);
            simpleButton1.Appearance.Options.UseBackColor = true;
            simpleButton1.Cursor = Cursors.Hand;
            simpleButton1.ImageOptions.Image = Properties.Resources.clear_32x32;
            simpleButton1.Location = new Point(225, 207);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(116, 38);
            simpleButton1.TabIndex = 6;
            simpleButton1.Text = "Cancel";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // pictureEdit1
            // 
            pictureEdit1.EditValue = resources.GetObject("pictureEdit1.EditValue");
            pictureEdit1.Location = new Point(17, 19);
            pictureEdit1.Name = "pictureEdit1";
            pictureEdit1.Properties.Appearance.BorderColor = Color.FromArgb(0, 192, 0);
            pictureEdit1.Properties.Appearance.Options.UseBorderColor = true;
            pictureEdit1.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            pictureEdit1.Properties.ShowCameraMenuItem = DevExpress.XtraEditors.Controls.CameraMenuItemVisibility.Auto;
            pictureEdit1.Properties.SizeMode = DevExpress.XtraEditors.Controls.PictureSizeMode.Stretch;
            pictureEdit1.Size = new Size(280, 267);
            pictureEdit1.TabIndex = 9;
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(labelControl6);
            panelControl1.Controls.Add(LookupRole);
            panelControl1.Controls.Add(txtPassword);
            panelControl1.Controls.Add(txtUserName);
            panelControl1.Controls.Add(labelControl1);
            panelControl1.Controls.Add(labelControl3);
            panelControl1.Controls.Add(labelControl2);
            panelControl1.Controls.Add(simpleButton1);
            panelControl1.Controls.Add(btnAddUser);
            panelControl1.Location = new Point(303, 19);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(359, 267);
            panelControl1.TabIndex = 10;
            // 
            // labelControl6
            // 
            labelControl6.Appearance.Font = new Font("Tahoma", 9.25F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl6.Appearance.Options.UseFont = true;
            labelControl6.Location = new Point(7, 132);
            labelControl6.Name = "labelControl6";
            labelControl6.Size = new Size(35, 14);
            labelControl6.TabIndex = 13;
            labelControl6.Text = "Role :";
            // 
            // LookupRole
            // 
            LookupRole.Location = new Point(81, 130);
            LookupRole.Name = "LookupRole";
            LookupRole.Properties.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            LookupRole.Properties.Appearance.Options.UseFont = true;
            LookupRole.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            LookupRole.Properties.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("RoleID", "RoleID", 20, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("RoleName", "RoleName") });
            LookupRole.Properties.DisplayMember = "RoleName";
            LookupRole.Properties.NullText = "Please Select Role ...";
            LookupRole.Properties.ValueMember = "RoleID";
            LookupRole.Size = new Size(260, 20);
            LookupRole.TabIndex = 12;
            // 
            // labelControl3
            // 
            labelControl3.Appearance.Font = new Font("Arial Rounded MT Bold", 12F, FontStyle.Underline, GraphicsUnit.Point);
            labelControl3.Appearance.ForeColor = Color.FromArgb(0, 192, 0);
            labelControl3.Appearance.Options.UseFont = true;
            labelControl3.Appearance.Options.UseForeColor = true;
            labelControl3.LineVisible = true;
            labelControl3.Location = new Point(9, 6);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(74, 18);
            labelControl3.TabIndex = 11;
            labelControl3.Text = "Add User";
            // 
            // labelControl4
            // 
            labelControl4.Appearance.ForeColor = Color.Gray;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.Location = new Point(59, 334);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(193, 13);
            labelControl4.TabIndex = 12;
            labelControl4.Text = "Ashina Warehouse Management System";
            // 
            // labelControl5
            // 
            labelControl5.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl5.Appearance.Options.UseFont = true;
            labelControl5.Location = new Point(17, 334);
            labelControl5.Name = "labelControl5";
            labelControl5.Size = new Size(33, 13);
            labelControl5.TabIndex = 13;
            labelControl5.Text = "AWMS";
            // 
            // frmAddUser
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(680, 358);
            Controls.Add(labelControl5);
            Controls.Add(labelControl4);
            Controls.Add(panelControl1);
            Controls.Add(pictureEdit1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Image = (Image)resources.GetObject("frmAddUser.IconOptions.Image");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmAddUser";
            Opacity = 0.9D;
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "AWMS Add User ";
            ((System.ComponentModel.ISupportInitialize)txtUserName.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)txtPassword.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)pictureEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)LookupRole.Properties).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private DevExpress.XtraEditors.TextEdit txtUserName;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.TextEdit txtPassword;
        private DevExpress.XtraEditors.SimpleButton btnAddUser;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.PictureEdit pictureEdit1;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LookUpEdit LookupRole;
    }
}