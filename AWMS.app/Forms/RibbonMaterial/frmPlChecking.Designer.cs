namespace AWMS.app.Forms.RibbonMaterial
{
    partial class frmPlChecking
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPlChecking));
            splitContainerControl1 = new DevExpress.XtraEditors.SplitContainerControl();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            lookUpEdit1 = new DevExpress.XtraEditors.LookUpEdit();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            documentViewer1 = new DevExpress.XtraPrinting.Preview.DocumentViewer();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).BeginInit();
            splitContainerControl1.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).BeginInit();
            splitContainerControl1.Panel2.SuspendLayout();
            splitContainerControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl1
            // 
            splitContainerControl1.Appearance.BorderColor = Color.Gray;
            splitContainerControl1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Dock = DockStyle.Fill;
            splitContainerControl1.Horizontal = false;
            splitContainerControl1.IsSplitterFixed = true;
            splitContainerControl1.Location = new Point(0, 0);
            splitContainerControl1.Name = "splitContainerControl1";
            // 
            // splitContainerControl1.Panel1
            // 
            splitContainerControl1.Panel1.Appearance.BorderColor = Color.FromArgb(64, 64, 64);
            splitContainerControl1.Panel1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel1.Controls.Add(simpleButton1);
            splitContainerControl1.Panel1.Controls.Add(lookUpEdit1);
            splitContainerControl1.Panel1.Controls.Add(labelControl1);
            splitContainerControl1.Panel1.Text = "Panel1";
            // 
            // splitContainerControl1.Panel2
            // 
            splitContainerControl1.Panel2.Appearance.BorderColor = Color.FromArgb(64, 64, 64);
            splitContainerControl1.Panel2.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel2.Controls.Add(documentViewer1);
            splitContainerControl1.Panel2.Text = "Panel2";
            splitContainerControl1.ShowSplitGlyph = DevExpress.Utils.DefaultBoolean.True;
            splitContainerControl1.Size = new Size(1112, 584);
            splitContainerControl1.SplitterPosition = 65;
            splitContainerControl1.TabIndex = 0;
            // 
            // simpleButton1
            // 
            simpleButton1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            simpleButton1.Appearance.BackColor = Color.FromArgb(192, 255, 192);
            simpleButton1.Appearance.Options.UseBackColor = true;
            simpleButton1.ImageOptions.Image = (Image)resources.GetObject("simpleButton1.ImageOptions.Image");
            simpleButton1.Location = new Point(990, 20);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(100, 23);
            simpleButton1.TabIndex = 2;
            simpleButton1.Text = "Refresh Data";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // lookUpEdit1
            // 
            lookUpEdit1.Location = new Point(83, 20);
            lookUpEdit1.Name = "lookUpEdit1";
            lookUpEdit1.Properties.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            lookUpEdit1.Properties.Appearance.Options.UseFont = true;
            lookUpEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEdit1.Properties.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("PLId", "PLId", 20, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("PLName", "PLName") });
            lookUpEdit1.Properties.DisplayMember = "PLName";
            lookUpEdit1.Properties.NullText = "Select Packing List ...";
            lookUpEdit1.Properties.PopupFilterMode = DevExpress.XtraEditors.PopupFilterMode.Contains;
            lookUpEdit1.Properties.ShowHeader = false;
            lookUpEdit1.Properties.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.Standard;
            lookUpEdit1.Properties.ValueMember = "PLId";
            lookUpEdit1.Size = new Size(400, 22);
            lookUpEdit1.TabIndex = 1;
            lookUpEdit1.EditValueChanged += lookUpEdit1_EditValueChanged;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 9.75F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Location = new Point(53, 23);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(24, 16);
            labelControl1.TabIndex = 0;
            labelControl1.Text = "PL :";
            // 
            // documentViewer1
            // 
            documentViewer1.Dock = DockStyle.Fill;
            documentViewer1.IsMetric = false;
            documentViewer1.Location = new Point(0, 0);
            documentViewer1.Name = "documentViewer1";
            documentViewer1.Size = new Size(1104, 501);
            documentViewer1.TabIndex = 0;
            // 
            // frmPlChecking
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1112, 584);
            Controls.Add(splitContainerControl1);
            Name = "frmPlChecking";
            Text = "PL Checking";
            Load += frmPlChecking_Load;
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).EndInit();
            splitContainerControl1.Panel1.ResumeLayout(false);
            splitContainerControl1.Panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).EndInit();
            splitContainerControl1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).EndInit();
            splitContainerControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.LookUpEdit lookUpEdit1;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraPrinting.Preview.DocumentViewer documentViewer1;
    }
}