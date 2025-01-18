namespace AWMS.app.Forms.RibbonVoucher
{
    partial class frmImportMrc
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmImportMrc));
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            panelControl3 = new DevExpress.XtraEditors.PanelControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            MrcId = new DevExpress.XtraGrid.Columns.GridColumn();
            ToCompanyID = new DevExpress.XtraGrid.Columns.GridColumn();
            MrcName = new DevExpress.XtraGrid.Columns.GridColumn();
            MrcDescription = new DevExpress.XtraGrid.Columns.GridColumn();
            PK = new DevExpress.XtraGrid.Columns.GridColumn();
            ItemOfPk = new DevExpress.XtraGrid.Columns.GridColumn();
            Tag = new DevExpress.XtraGrid.Columns.GridColumn();
            Description = new DevExpress.XtraGrid.Columns.GridColumn();
            UnitID = new DevExpress.XtraGrid.Columns.GridColumn();
            Qty = new DevExpress.XtraGrid.Columns.GridColumn();
            Size1 = new DevExpress.XtraGrid.Columns.GridColumn();
            Size2 = new DevExpress.XtraGrid.Columns.GridColumn();
            BatchNo = new DevExpress.XtraGrid.Columns.GridColumn();
            DocNo = new DevExpress.XtraGrid.Columns.GridColumn();
            Remark = new DevExpress.XtraGrid.Columns.GridColumn();
            colEnteredBy = new DevExpress.XtraGrid.Columns.GridColumn();
            colEnteredDate = new DevExpress.XtraGrid.Columns.GridColumn();
            colEditedBy = new DevExpress.XtraGrid.Columns.GridColumn();
            colEditedDate = new DevExpress.XtraGrid.Columns.GridColumn();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            panelControl4 = new DevExpress.XtraEditors.PanelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            textEditMrcName = new DevExpress.XtraEditors.TextEdit();
            lookUpEditCompany = new DevExpress.XtraEditors.LookUpEdit();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            btnImport = new DevExpress.XtraEditors.SimpleButton();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            txtmrcDescription = new DevExpress.XtraEditors.MemoEdit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl3).BeginInit();
            panelControl3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl4).BeginInit();
            panelControl4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)textEditMrcName.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)lookUpEditCompany.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)txtmrcDescription.Properties).BeginInit();
            SuspendLayout();
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(panelControl3);
            panelControl1.Controls.Add(panelControl2);
            panelControl1.Dock = DockStyle.Fill;
            panelControl1.Location = new Point(0, 0);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(919, 450);
            panelControl1.TabIndex = 0;
            // 
            // panelControl3
            // 
            panelControl3.Controls.Add(gridControl1);
            panelControl3.Dock = DockStyle.Fill;
            panelControl3.Location = new Point(2, 146);
            panelControl3.Name = "panelControl3";
            panelControl3.Size = new Size(915, 302);
            panelControl3.TabIndex = 1;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(2, 2);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(911, 298);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.Appearance.HeaderPanel.Options.UseTextOptions = true;
            gridView1.Appearance.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.HeaderPanel.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Appearance.Row.Options.UseTextOptions = true;
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Appearance.SelectedRow.Options.UseTextOptions = true;
            gridView1.Appearance.SelectedRow.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.SelectedRow.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] { MrcId, ToCompanyID, MrcName, MrcDescription, PK, ItemOfPk, Tag, Description, UnitID, Qty, Size1, Size2, BatchNo, DocNo, Remark, colEnteredBy, colEnteredDate, colEditedBy, colEditedDate });
            gridView1.DetailHeight = 284;
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            gridView1.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.True;
            gridView1.OptionsBehavior.Editable = false;
            gridView1.OptionsEditForm.PopupEditFormWidth = 686;
            gridView1.OptionsView.ShowAutoFilterRow = true;
            // 
            // MrcId
            // 
            MrcId.Caption = "MrcId";
            MrcId.FieldName = "MrcId";
            MrcId.MinWidth = 21;
            MrcId.Name = "MrcId";
            MrcId.Width = 77;
            // 
            // ToCompanyID
            // 
            ToCompanyID.Caption = "To Company";
            ToCompanyID.FieldName = "ToCompanyID";
            ToCompanyID.MinWidth = 21;
            ToCompanyID.Name = "ToCompanyID";
            ToCompanyID.Visible = true;
            ToCompanyID.VisibleIndex = 0;
            ToCompanyID.Width = 161;
            // 
            // MrcName
            // 
            MrcName.Caption = "Mrc Name";
            MrcName.FieldName = "MrcName";
            MrcName.MinWidth = 21;
            MrcName.Name = "MrcName";
            MrcName.Visible = true;
            MrcName.VisibleIndex = 1;
            MrcName.Width = 161;
            // 
            // MrcDescription
            // 
            MrcDescription.Caption = "Mrc Description";
            MrcDescription.FieldName = "MrcDescription";
            MrcDescription.MinWidth = 21;
            MrcDescription.Name = "MrcDescription";
            MrcDescription.Visible = true;
            MrcDescription.VisibleIndex = 2;
            MrcDescription.Width = 67;
            // 
            // PK
            // 
            PK.Caption = "PK";
            PK.FieldName = "PK";
            PK.MinWidth = 21;
            PK.Name = "PK";
            PK.Visible = true;
            PK.VisibleIndex = 5;
            PK.Width = 184;
            // 
            // ItemOfPk
            // 
            ItemOfPk.Caption = "ItemOfPk";
            ItemOfPk.FieldName = "ItemOfPk";
            ItemOfPk.Name = "ItemOfPk";
            ItemOfPk.Visible = true;
            ItemOfPk.VisibleIndex = 3;
            // 
            // Tag
            // 
            Tag.Caption = "Tag";
            Tag.FieldName = "Tag";
            Tag.Name = "Tag";
            Tag.Visible = true;
            Tag.VisibleIndex = 4;
            // 
            // Description
            // 
            Description.Caption = "Description";
            Description.FieldName = "Description";
            Description.MinWidth = 21;
            Description.Name = "Description";
            Description.Visible = true;
            Description.VisibleIndex = 6;
            Description.Width = 376;
            // 
            // UnitID
            // 
            UnitID.Caption = "Unit";
            UnitID.FieldName = "UnitID";
            UnitID.MinWidth = 21;
            UnitID.Name = "UnitID";
            UnitID.Visible = true;
            UnitID.VisibleIndex = 7;
            UnitID.Width = 152;
            // 
            // Qty
            // 
            Qty.Caption = "Qty";
            Qty.FieldName = "Qty";
            Qty.Name = "Qty";
            Qty.Visible = true;
            Qty.VisibleIndex = 8;
            // 
            // Size1
            // 
            Size1.Caption = "Size1";
            Size1.FieldName = "Size1";
            Size1.Name = "Size1";
            // 
            // Size2
            // 
            Size2.Caption = "Size2";
            Size2.FieldName = "Size2";
            Size2.Name = "Size2";
            // 
            // BatchNo
            // 
            BatchNo.Caption = "BatchNo";
            BatchNo.FieldName = "BatchNo";
            BatchNo.Name = "BatchNo";
            // 
            // DocNo
            // 
            DocNo.Caption = "DocNo";
            DocNo.FieldName = "DocNo";
            DocNo.Name = "DocNo";
            // 
            // Remark
            // 
            Remark.Caption = "Remark";
            Remark.FieldName = "Remark";
            Remark.Name = "Remark";
            Remark.Visible = true;
            Remark.VisibleIndex = 9;
            // 
            // colEnteredBy
            // 
            colEnteredBy.FieldName = "EnteredBy";
            colEnteredBy.MinWidth = 21;
            colEnteredBy.Name = "colEnteredBy";
            colEnteredBy.Width = 92;
            // 
            // colEnteredDate
            // 
            colEnteredDate.FieldName = "EnteredDate";
            colEnteredDate.MinWidth = 21;
            colEnteredDate.Name = "colEnteredDate";
            colEnteredDate.Width = 92;
            // 
            // colEditedBy
            // 
            colEditedBy.FieldName = "EditedBy";
            colEditedBy.MinWidth = 21;
            colEditedBy.Name = "colEditedBy";
            colEditedBy.Width = 92;
            // 
            // colEditedDate
            // 
            colEditedDate.FieldName = "EditedDate";
            colEditedDate.MinWidth = 21;
            colEditedDate.Name = "colEditedDate";
            colEditedDate.OptionsColumn.ReadOnly = true;
            colEditedDate.Width = 104;
            // 
            // panelControl2
            // 
            panelControl2.Controls.Add(panelControl4);
            panelControl2.Dock = DockStyle.Top;
            panelControl2.Location = new Point(2, 2);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(915, 144);
            panelControl2.TabIndex = 0;
            // 
            // panelControl4
            // 
            panelControl4.Appearance.BackColor = Color.Linen;
            panelControl4.Appearance.Options.UseBackColor = true;
            panelControl4.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            panelControl4.Controls.Add(labelControl4);
            panelControl4.Controls.Add(textEditMrcName);
            panelControl4.Controls.Add(lookUpEditCompany);
            panelControl4.Controls.Add(labelControl2);
            panelControl4.Controls.Add(btnImport);
            panelControl4.Controls.Add(labelControl1);
            panelControl4.Controls.Add(txtmrcDescription);
            panelControl4.Location = new Point(15, 9);
            panelControl4.Name = "panelControl4";
            panelControl4.Size = new Size(890, 127);
            panelControl4.TabIndex = 4;
            // 
            // labelControl4
            // 
            labelControl4.Location = new Point(12, 47);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(85, 13);
            labelControl4.TabIndex = 98;
            labelControl4.Text = "MRC Description :";
            // 
            // textEditMrcName
            // 
            textEditMrcName.Location = new Point(322, 8);
            textEditMrcName.Name = "textEditMrcName";
            textEditMrcName.Size = new Size(330, 20);
            textEditMrcName.TabIndex = 95;
            // 
            // lookUpEditCompany
            // 
            lookUpEditCompany.Location = new Point(68, 8);
            lookUpEditCompany.Name = "lookUpEditCompany";
            lookUpEditCompany.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEditCompany.Properties.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("CompanyID", "CompanyID", 67, DevExpress.Utils.FormatType.Numeric, "", false, DevExpress.Utils.HorzAlignment.Far, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("CompanyName", "Company", 85, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Near, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            lookUpEditCompany.Properties.DisplayMember = "CompanyName";
            lookUpEditCompany.Properties.NullText = "Select Company ...";
            lookUpEditCompany.Properties.ValueMember = "CompanyID";
            lookUpEditCompany.Size = new Size(178, 20);
            lookUpEditCompany.TabIndex = 93;
            // 
            // labelControl2
            // 
            labelControl2.Location = new Point(12, 12);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(52, 13);
            labelControl2.TabIndex = 94;
            labelControl2.Text = "Company :";
            // 
            // btnImport
            // 
            btnImport.ImageOptions.Image = (Image)resources.GetObject("btnImport.ImageOptions.Image");
            btnImport.Location = new Point(769, 74);
            btnImport.Name = "btnImport";
            btnImport.Size = new Size(108, 38);
            btnImport.TabIndex = 6;
            btnImport.Text = "Import";
            btnImport.Click += btnImport_Click;
            // 
            // labelControl1
            // 
            labelControl1.Location = new Point(259, 12);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(56, 13);
            labelControl1.TabIndex = 2;
            labelControl1.Text = "MRC Name:";
            // 
            // txtmrcDescription
            // 
            txtmrcDescription.Location = new Point(113, 47);
            txtmrcDescription.Name = "txtmrcDescription";
            txtmrcDescription.Size = new Size(539, 69);
            txtmrcDescription.TabIndex = 97;
            // 
            // frmImportMrc
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(919, 450);
            Controls.Add(panelControl1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Image = Properties.Resources.exporttoxls_16x164;
            MaximizeBox = false;
            Name = "frmImportMrc";
            Text = "Import MRC";
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl3).EndInit();
            panelControl3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl4).EndInit();
            panelControl4.ResumeLayout(false);
            panelControl4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)textEditMrcName.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)lookUpEditCompany.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)txtmrcDescription.Properties).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.PanelControl panelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl4;
        private DevExpress.XtraEditors.SimpleButton btnImport;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn MrcId;
        private DevExpress.XtraGrid.Columns.GridColumn ToCompanyID;
        private DevExpress.XtraGrid.Columns.GridColumn MrcName;
        private DevExpress.XtraGrid.Columns.GridColumn MrcDescription;
        private DevExpress.XtraGrid.Columns.GridColumn PK;
        private DevExpress.XtraGrid.Columns.GridColumn Description;
        private DevExpress.XtraGrid.Columns.GridColumn UnitID;
        private DevExpress.XtraGrid.Columns.GridColumn colEnteredBy;
        private DevExpress.XtraGrid.Columns.GridColumn colEnteredDate;
        private DevExpress.XtraGrid.Columns.GridColumn colEditedBy;
        private DevExpress.XtraGrid.Columns.GridColumn colEditedDate;
        private DevExpress.XtraEditors.LookUpEdit lookUpEditCompany;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.TextEdit textEditMrcName;
        private DevExpress.XtraEditors.MemoEdit txtmrcDescription;
        private DevExpress.XtraGrid.Columns.GridColumn ItemOfPk;
        private DevExpress.XtraGrid.Columns.GridColumn Tag;
        private DevExpress.XtraGrid.Columns.GridColumn Qty;
        private DevExpress.XtraGrid.Columns.GridColumn Size1;
        private DevExpress.XtraGrid.Columns.GridColumn Size2;
        private DevExpress.XtraGrid.Columns.GridColumn BatchNo;
        private DevExpress.XtraGrid.Columns.GridColumn DocNo;
        private DevExpress.XtraGrid.Columns.GridColumn Remark;
    }
}