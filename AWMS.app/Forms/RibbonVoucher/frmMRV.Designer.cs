namespace AWMS.app.Forms.RibbonVoucher
{
    partial class frmMRV
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMRV));
            splitContainerControl1 = new DevExpress.XtraEditors.SplitContainerControl();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            lookUpEdit2 = new DevExpress.XtraEditors.LookUpEdit();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            dateEdit1 = new DevExpress.XtraEditors.DateEdit();
            simpleButton2 = new DevExpress.XtraEditors.SimpleButton();
            textEdit1 = new DevExpress.XtraEditors.TextEdit();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            btnShowAllIssued = new DevExpress.XtraEditors.SimpleButton();
            lookUpEdit1 = new DevExpress.XtraEditors.LookUpEdit();
            splitContainerControl2 = new DevExpress.XtraEditors.SplitContainerControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            gridControl2 = new DevExpress.XtraGrid.GridControl();
            gridView2 = new DevExpress.XtraGrid.Views.Grid.GridView();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).BeginInit();
            splitContainerControl1.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).BeginInit();
            splitContainerControl1.Panel2.SuspendLayout();
            splitContainerControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit2.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties.CalendarTimeProperties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)textEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).BeginInit();
            splitContainerControl2.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).BeginInit();
            splitContainerControl2.Panel2.SuspendLayout();
            splitContainerControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridControl2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView2).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl1
            // 
            splitContainerControl1.Appearance.BorderColor = Color.Silver;
            splitContainerControl1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Dock = DockStyle.Fill;
            splitContainerControl1.Horizontal = false;
            splitContainerControl1.Location = new Point(0, 0);
            splitContainerControl1.Name = "splitContainerControl1";
            // 
            // splitContainerControl1.Panel1
            // 
            splitContainerControl1.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel1.Controls.Add(panelControl2);
            splitContainerControl1.Panel1.Controls.Add(panelControl1);
            splitContainerControl1.Panel1.Text = "Panel1";
            // 
            // splitContainerControl1.Panel2
            // 
            splitContainerControl1.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel2.Controls.Add(splitContainerControl2);
            splitContainerControl1.Panel2.Text = "Panel2";
            splitContainerControl1.Size = new Size(1061, 569);
            splitContainerControl1.SplitterPosition = 99;
            splitContainerControl1.TabIndex = 0;
            // 
            // panelControl2
            // 
            panelControl2.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            panelControl2.Controls.Add(labelControl4);
            panelControl2.Controls.Add(lookUpEdit2);
            panelControl2.Controls.Add(labelControl3);
            panelControl2.Controls.Add(dateEdit1);
            panelControl2.Controls.Add(simpleButton2);
            panelControl2.Controls.Add(textEdit1);
            panelControl2.Controls.Add(labelControl2);
            panelControl2.Location = new Point(541, 7);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(504, 81);
            panelControl2.TabIndex = 6;
            // 
            // labelControl4
            // 
            labelControl4.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            labelControl4.Location = new Point(191, 49);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(56, 13);
            labelControl4.TabIndex = 9;
            labelControl4.Text = "Contract :";
            // 
            // lookUpEdit2
            // 
            lookUpEdit2.Location = new Point(252, 45);
            lookUpEdit2.Name = "lookUpEdit2";
            lookUpEdit2.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEdit2.Properties.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("ContractID", "ContractID", 20, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("ContractNumber", "ContractNumber") });
            lookUpEdit2.Properties.DisplayMember = "ContractNumber";
            lookUpEdit2.Properties.NullText = "";
            lookUpEdit2.Properties.PopupFilterMode = DevExpress.XtraEditors.PopupFilterMode.Contains;
            lookUpEdit2.Properties.ShowHeader = false;
            lookUpEdit2.Properties.ValueMember = "ContactID";
            lookUpEdit2.Size = new Size(121, 20);
            lookUpEdit2.TabIndex = 8;
            // 
            // labelControl3
            // 
            labelControl3.Location = new Point(8, 49);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(30, 13);
            labelControl3.TabIndex = 7;
            labelControl3.Text = "Date :";
            // 
            // dateEdit1
            // 
            dateEdit1.EditValue = null;
            dateEdit1.Location = new Point(47, 45);
            dateEdit1.Name = "dateEdit1";
            dateEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            dateEdit1.Properties.CalendarTimeProperties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            dateEdit1.Properties.CalendarView = DevExpress.XtraEditors.Repository.CalendarView.TouchUI;
            dateEdit1.Properties.VistaDisplayMode = DevExpress.Utils.DefaultBoolean.False;
            dateEdit1.Size = new Size(134, 20);
            dateEdit1.TabIndex = 6;
            // 
            // simpleButton2
            // 
            simpleButton2.Appearance.BackColor = Color.YellowGreen;
            simpleButton2.Appearance.Options.UseBackColor = true;
            simpleButton2.Location = new Point(384, 11);
            simpleButton2.Name = "simpleButton2";
            simpleButton2.Size = new Size(107, 54);
            simpleButton2.TabIndex = 5;
            simpleButton2.Text = "INSERT MRV";
            // 
            // textEdit1
            // 
            textEdit1.Location = new Point(61, 8);
            textEdit1.Name = "textEdit1";
            textEdit1.Size = new Size(312, 20);
            textEdit1.TabIndex = 3;
            // 
            // labelControl2
            // 
            labelControl2.Location = new Point(8, 11);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(44, 13);
            labelControl2.TabIndex = 2;
            labelControl2.Text = "MRV.no :";
            // 
            // panelControl1
            // 
            panelControl1.Appearance.BorderColor = Color.Silver;
            panelControl1.Appearance.Options.UseBorderColor = true;
            panelControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            panelControl1.Controls.Add(labelControl1);
            panelControl1.Controls.Add(btnShowAllIssued);
            panelControl1.Controls.Add(lookUpEdit1);
            panelControl1.Location = new Point(8, 7);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(267, 81);
            panelControl1.TabIndex = 5;
            // 
            // labelControl1
            // 
            labelControl1.AutoSizeMode = DevExpress.XtraEditors.LabelAutoSizeMode.Vertical;
            labelControl1.Location = new Point(6, 15);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(56, 13);
            labelControl1.TabIndex = 1;
            labelControl1.Text = "Company :";
            // 
            // btnShowAllIssued
            // 
            btnShowAllIssued.Appearance.BackColor = Color.FromArgb(192, 255, 255);
            btnShowAllIssued.Appearance.BorderColor = Color.Silver;
            btnShowAllIssued.Appearance.Options.UseBackColor = true;
            btnShowAllIssued.Appearance.Options.UseBorderColor = true;
            btnShowAllIssued.Location = new Point(158, 37);
            btnShowAllIssued.Name = "btnShowAllIssued";
            btnShowAllIssued.Size = new Size(104, 36);
            btnShowAllIssued.TabIndex = 4;
            btnShowAllIssued.Text = "Show All Issued";
            btnShowAllIssued.Click += btnShowAllIssued_Click;
            // 
            // lookUpEdit1
            // 
            lookUpEdit1.Location = new Point(67, 11);
            lookUpEdit1.Name = "lookUpEdit1";
            lookUpEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEdit1.Properties.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("CompanyID", "CompanyID", 20, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("CompanyName", "CompanyName") });
            lookUpEdit1.Properties.DisplayMember = "CompanyName";
            lookUpEdit1.Properties.NullText = "Select Company ...";
            lookUpEdit1.Properties.PopupFilterMode = DevExpress.XtraEditors.PopupFilterMode.Contains;
            lookUpEdit1.Properties.ShowHeader = false;
            lookUpEdit1.Properties.ValueMember = "CompanyID";
            lookUpEdit1.Size = new Size(195, 20);
            lookUpEdit1.TabIndex = 0;
            lookUpEdit1.EditValueChanged += lookUpEdit1_EditValueChanged;
            // 
            // splitContainerControl2
            // 
            splitContainerControl2.Dock = DockStyle.Fill;
            splitContainerControl2.Location = new Point(0, 0);
            splitContainerControl2.Name = "splitContainerControl2";
            // 
            // splitContainerControl2.Panel1
            // 
            splitContainerControl2.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel1.Controls.Add(gridControl1);
            splitContainerControl2.Panel1.Text = "Panel1";
            // 
            // splitContainerControl2.Panel2
            // 
            splitContainerControl2.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel2.Controls.Add(gridControl2);
            splitContainerControl2.Panel2.Text = "Panel2";
            splitContainerControl2.Size = new Size(1053, 452);
            splitContainerControl2.SplitterPosition = 529;
            splitContainerControl2.TabIndex = 0;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(525, 448);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowGroupPanel = false;
            // 
            // gridControl2
            // 
            gridControl2.Dock = DockStyle.Fill;
            gridControl2.Location = new Point(0, 0);
            gridControl2.MainView = gridView2;
            gridControl2.Name = "gridControl2";
            gridControl2.Size = new Size(510, 448);
            gridControl2.TabIndex = 0;
            gridControl2.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView2 });
            // 
            // gridView2
            // 
            gridView2.GridControl = gridControl2;
            gridView2.Name = "gridView2";
            gridView2.OptionsView.ShowAutoFilterRow = true;
            gridView2.OptionsView.ShowFooter = true;
            gridView2.OptionsView.ShowGroupPanel = false;
            // 
            // frmMRV
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1061, 569);
            Controls.Add(splitContainerControl1);
            IconOptions.Image = (Image)resources.GetObject("frmMRV.IconOptions.Image");
            Name = "frmMRV";
            Text = "MRV - Material Return Voucher";
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).EndInit();
            splitContainerControl1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).EndInit();
            splitContainerControl1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).EndInit();
            splitContainerControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            panelControl2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit2.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties.CalendarTimeProperties).EndInit();
            ((System.ComponentModel.ISupportInitialize)dateEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)textEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).EndInit();
            splitContainerControl2.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).EndInit();
            splitContainerControl2.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).EndInit();
            splitContainerControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridControl2).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView2).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl2;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnShowAllIssued;
        private DevExpress.XtraEditors.TextEdit textEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.SimpleButton simpleButton2;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.GridControl gridControl2;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView2;
        private DevExpress.XtraEditors.DateEdit dateEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.LookUpEdit lookUpEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LookUpEdit lookUpEdit2;
    }
}