namespace AWMS.app.Forms.RibbonVoucher
{
    partial class frmManageMrc
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmManageMrc));
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            panelControl3 = new DevExpress.XtraEditors.PanelControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            MrcId = new DevExpress.XtraGrid.Columns.GridColumn();
            ToCompany = new DevExpress.XtraGrid.Columns.GridColumn();
            MrcName = new DevExpress.XtraGrid.Columns.GridColumn();
            MrcDescription = new DevExpress.XtraGrid.Columns.GridColumn();
            PK = new DevExpress.XtraGrid.Columns.GridColumn();
            ItemOfPk = new DevExpress.XtraGrid.Columns.GridColumn();
            Tag = new DevExpress.XtraGrid.Columns.GridColumn();
            Description = new DevExpress.XtraGrid.Columns.GridColumn();
            Unit = new DevExpress.XtraGrid.Columns.GridColumn();
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
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            lookUpEdit1 = new DevExpress.XtraEditors.LookUpEdit();
            btnRefreshData = new DevExpress.XtraEditors.SimpleButton();
            panelControl5 = new DevExpress.XtraEditors.PanelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            btnDeleteMRC = new DevExpress.XtraEditors.SimpleButton();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            btnDeleteItem = new DevExpress.XtraEditors.SimpleButton();
            chkAllowEdit = new DevExpress.XtraEditors.CheckEdit();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            btnPrintMRC = new DevExpress.XtraEditors.SimpleButton();
            ExcelExportBarButtonItem = new DevExpress.XtraBars.BarButtonItem();
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
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl5).BeginInit();
            panelControl5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)chkAllowEdit.Properties).BeginInit();
            SuspendLayout();
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(panelControl3);
            panelControl1.Controls.Add(panelControl2);
            panelControl1.Dock = DockStyle.Fill;
            panelControl1.Location = new Point(0, 0);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(1106, 450);
            panelControl1.TabIndex = 0;
            // 
            // panelControl3
            // 
            panelControl3.Controls.Add(gridControl1);
            panelControl3.Dock = DockStyle.Fill;
            panelControl3.Location = new Point(2, 95);
            panelControl3.Name = "panelControl3";
            panelControl3.Size = new Size(1102, 353);
            panelControl3.TabIndex = 1;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(2, 2);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(1098, 349);
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
            gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] { MrcId, ToCompany, MrcName, MrcDescription, PK, ItemOfPk, Tag, Description, Unit, Qty, Size1, Size2, BatchNo, DocNo, Remark, colEnteredBy, colEnteredDate, colEditedBy, colEditedDate });
            gridView1.DetailHeight = 284;
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.False;
            gridView1.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.True;
            gridView1.OptionsBehavior.ReadOnly = true;
            gridView1.OptionsEditForm.PopupEditFormWidth = 686;
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowFooter = true;
            gridView1.CellValueChanged += gridView1_CellValueChanged;
            // 
            // MrcId
            // 
            MrcId.Caption = "MrcId";
            MrcId.FieldName = "MrcId";
            MrcId.MinWidth = 21;
            MrcId.Name = "MrcId";
            MrcId.OptionsColumn.AllowEdit = false;
            MrcId.Width = 77;
            // 
            // ToCompany
            // 
            ToCompany.Caption = "To Company";
            ToCompany.FieldName = "ToCompany";
            ToCompany.MinWidth = 21;
            ToCompany.Name = "ToCompany";
            ToCompany.OptionsColumn.AllowEdit = false;
            ToCompany.Visible = true;
            ToCompany.VisibleIndex = 0;
            ToCompany.Width = 78;
            // 
            // MrcName
            // 
            MrcName.Caption = "Mrc Name";
            MrcName.FieldName = "MrcName";
            MrcName.MinWidth = 21;
            MrcName.Name = "MrcName";
            MrcName.OptionsColumn.AllowEdit = false;
            MrcName.Visible = true;
            MrcName.VisibleIndex = 1;
            MrcName.Width = 78;
            // 
            // MrcDescription
            // 
            MrcDescription.Caption = "Mrc Description";
            MrcDescription.FieldName = "MrcDescription";
            MrcDescription.MinWidth = 21;
            MrcDescription.Name = "MrcDescription";
            MrcDescription.OptionsColumn.AllowEdit = false;
            MrcDescription.Visible = true;
            MrcDescription.VisibleIndex = 2;
            MrcDescription.Width = 32;
            // 
            // PK
            // 
            PK.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            PK.AppearanceHeader.Options.UseBackColor = true;
            PK.Caption = "PK";
            PK.FieldName = "PK";
            PK.MinWidth = 21;
            PK.Name = "PK";
            PK.Visible = true;
            PK.VisibleIndex = 3;
            PK.Width = 39;
            // 
            // ItemOfPk
            // 
            ItemOfPk.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            ItemOfPk.AppearanceHeader.Options.UseBackColor = true;
            ItemOfPk.Caption = "ItemOfPk";
            ItemOfPk.FieldName = "ItemOfPk";
            ItemOfPk.Name = "ItemOfPk";
            ItemOfPk.Visible = true;
            ItemOfPk.VisibleIndex = 4;
            ItemOfPk.Width = 40;
            // 
            // Tag
            // 
            Tag.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Tag.AppearanceHeader.Options.UseBackColor = true;
            Tag.Caption = "Tag";
            Tag.FieldName = "Tag";
            Tag.Name = "Tag";
            Tag.Visible = true;
            Tag.VisibleIndex = 5;
            Tag.Width = 40;
            // 
            // Description
            // 
            Description.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Description.AppearanceHeader.Options.UseBackColor = true;
            Description.Caption = "Description";
            Description.FieldName = "Description";
            Description.MinWidth = 21;
            Description.Name = "Description";
            Description.Visible = true;
            Description.VisibleIndex = 6;
            Description.Width = 206;
            // 
            // Unit
            // 
            Unit.Caption = "Unit";
            Unit.FieldName = "Unit";
            Unit.MinWidth = 21;
            Unit.Name = "Unit";
            Unit.OptionsColumn.AllowEdit = false;
            Unit.Visible = true;
            Unit.VisibleIndex = 7;
            Unit.Width = 83;
            // 
            // Qty
            // 
            Qty.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Qty.AppearanceHeader.Options.UseBackColor = true;
            Qty.Caption = "Qty";
            Qty.FieldName = "Qty";
            Qty.Name = "Qty";
            Qty.Visible = true;
            Qty.VisibleIndex = 8;
            Qty.Width = 40;
            // 
            // Size1
            // 
            Size1.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Size1.AppearanceHeader.Options.UseBackColor = true;
            Size1.Caption = "Size1";
            Size1.FieldName = "Size1";
            Size1.Name = "Size1";
            // 
            // Size2
            // 
            Size2.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Size2.AppearanceHeader.Options.UseBackColor = true;
            Size2.Caption = "Size2";
            Size2.FieldName = "Size2";
            Size2.Name = "Size2";
            // 
            // BatchNo
            // 
            BatchNo.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            BatchNo.AppearanceHeader.Options.UseBackColor = true;
            BatchNo.Caption = "BatchNo";
            BatchNo.FieldName = "BatchNo";
            BatchNo.Name = "BatchNo";
            // 
            // DocNo
            // 
            DocNo.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            DocNo.AppearanceHeader.Options.UseBackColor = true;
            DocNo.Caption = "DocNo";
            DocNo.FieldName = "DocNo";
            DocNo.Name = "DocNo";
            // 
            // Remark
            // 
            Remark.AppearanceHeader.BackColor = Color.FromArgb(192, 255, 255);
            Remark.AppearanceHeader.Options.UseBackColor = true;
            Remark.Caption = "Remark";
            Remark.FieldName = "Remark";
            Remark.Name = "Remark";
            Remark.Visible = true;
            Remark.VisibleIndex = 9;
            Remark.Width = 51;
            // 
            // colEnteredBy
            // 
            colEnteredBy.FieldName = "EnteredBy";
            colEnteredBy.MinWidth = 21;
            colEnteredBy.Name = "colEnteredBy";
            colEnteredBy.OptionsColumn.AllowEdit = false;
            colEnteredBy.Width = 92;
            // 
            // colEnteredDate
            // 
            colEnteredDate.FieldName = "EnteredDate";
            colEnteredDate.MinWidth = 21;
            colEnteredDate.Name = "colEnteredDate";
            colEnteredDate.OptionsColumn.AllowEdit = false;
            colEnteredDate.Width = 92;
            // 
            // colEditedBy
            // 
            colEditedBy.FieldName = "EditedBy";
            colEditedBy.MinWidth = 21;
            colEditedBy.Name = "colEditedBy";
            colEditedBy.OptionsColumn.AllowEdit = false;
            colEditedBy.Width = 92;
            // 
            // colEditedDate
            // 
            colEditedDate.FieldName = "EditedDate";
            colEditedDate.MinWidth = 21;
            colEditedDate.Name = "colEditedDate";
            colEditedDate.OptionsColumn.AllowEdit = false;
            colEditedDate.OptionsColumn.ReadOnly = true;
            colEditedDate.Width = 104;
            // 
            // panelControl2
            // 
            panelControl2.Controls.Add(panelControl4);
            panelControl2.Dock = DockStyle.Top;
            panelControl2.Location = new Point(2, 2);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(1102, 93);
            panelControl2.TabIndex = 0;
            // 
            // panelControl4
            // 
            panelControl4.Appearance.BackColor = Color.Linen;
            panelControl4.Appearance.Options.UseBackColor = true;
            panelControl4.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            panelControl4.Controls.Add(simpleButton1);
            panelControl4.Controls.Add(lookUpEdit1);
            panelControl4.Controls.Add(btnRefreshData);
            panelControl4.Controls.Add(panelControl5);
            panelControl4.Controls.Add(labelControl2);
            panelControl4.Controls.Add(btnPrintMRC);
            panelControl4.Location = new Point(15, 8);
            panelControl4.Name = "panelControl4";
            panelControl4.Size = new Size(1077, 78);
            panelControl4.TabIndex = 4;
            // 
            // simpleButton1
            // 
            simpleButton1.ImageOptions.Image = (Image)resources.GetObject("simpleButton1.ImageOptions.Image");
            simpleButton1.Location = new Point(659, 14);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(103, 24);
            simpleButton1.TabIndex = 141;
            simpleButton1.Text = "Export";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // lookUpEdit1
            // 
            lookUpEdit1.Location = new Point(91, 29);
            lookUpEdit1.Name = "lookUpEdit1";
            lookUpEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEdit1.Properties.NullText = "Select MRC ...";
            lookUpEdit1.Properties.ShowHeader = false;
            lookUpEdit1.Size = new Size(227, 20);
            lookUpEdit1.TabIndex = 140;
            // 
            // btnRefreshData
            // 
            btnRefreshData.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnRefreshData.ImageOptions.Image = (Image)resources.GetObject("btnRefreshData.ImageOptions.Image");
            btnRefreshData.Location = new Point(659, 43);
            btnRefreshData.Margin = new Padding(3, 2, 3, 2);
            btnRefreshData.Name = "btnRefreshData";
            btnRefreshData.Size = new Size(103, 24);
            btnRefreshData.TabIndex = 139;
            btnRefreshData.Text = "Refresh DATA";
            btnRefreshData.Click += btnRefreshData_Click;
            // 
            // panelControl5
            // 
            panelControl5.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            panelControl5.Appearance.BackColor = Color.FromArgb(255, 224, 192);
            panelControl5.Appearance.Options.UseBackColor = true;
            panelControl5.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            panelControl5.Controls.Add(labelControl4);
            panelControl5.Controls.Add(labelControl3);
            panelControl5.Controls.Add(btnDeleteMRC);
            panelControl5.Controls.Add(labelControl1);
            panelControl5.Controls.Add(btnDeleteItem);
            panelControl5.Controls.Add(chkAllowEdit);
            panelControl5.Location = new Point(768, 11);
            panelControl5.Margin = new Padding(3, 2, 3, 2);
            panelControl5.Name = "panelControl5";
            panelControl5.Size = new Size(302, 59);
            panelControl5.TabIndex = 96;
            // 
            // labelControl4
            // 
            labelControl4.Appearance.ForeColor = Color.Teal;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.Location = new Point(7, 40);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(195, 13);
            labelControl4.TabIndex = 142;
            labelControl4.Text = "You can delete the MRC and add it again";
            // 
            // labelControl3
            // 
            labelControl3.Appearance.ForeColor = Color.Teal;
            labelControl3.Appearance.Options.UseForeColor = true;
            labelControl3.Location = new Point(7, 26);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(167, 13);
            labelControl3.TabIndex = 141;
            labelControl3.Text = "You can edit only the blue column's";
            // 
            // btnDeleteMRC
            // 
            btnDeleteMRC.Appearance.BackColor = Color.FromArgb(255, 192, 192);
            btnDeleteMRC.Appearance.Options.UseBackColor = true;
            btnDeleteMRC.ImageOptions.Image = (Image)resources.GetObject("btnDeleteMRC.ImageOptions.Image");
            btnDeleteMRC.Location = new Point(213, 32);
            btnDeleteMRC.Name = "btnDeleteMRC";
            btnDeleteMRC.Size = new Size(83, 21);
            btnDeleteMRC.TabIndex = 96;
            btnDeleteMRC.Text = "Delete MRC";
            btnDeleteMRC.Click += btnDeleteMRC_Click;
            // 
            // labelControl1
            // 
            labelControl1.ImageOptions.Image = (Image)resources.GetObject("labelControl1.ImageOptions.Image");
            labelControl1.Location = new Point(12, 8);
            labelControl1.Margin = new Padding(3, 2, 3, 2);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(16, 16);
            labelControl1.TabIndex = 3;
            // 
            // btnDeleteItem
            // 
            btnDeleteItem.ImageOptions.Image = (Image)resources.GetObject("btnDeleteItem.ImageOptions.Image");
            btnDeleteItem.Location = new Point(213, 6);
            btnDeleteItem.Name = "btnDeleteItem";
            btnDeleteItem.Size = new Size(83, 21);
            btnDeleteItem.TabIndex = 95;
            btnDeleteItem.Text = "Delete Item";
            btnDeleteItem.Click += btnDeleteItem_Click;
            // 
            // chkAllowEdit
            // 
            chkAllowEdit.Location = new Point(31, 6);
            chkAllowEdit.Margin = new Padding(3, 2, 3, 2);
            chkAllowEdit.Name = "chkAllowEdit";
            chkAllowEdit.Properties.Caption = "Allow Edit";
            chkAllowEdit.Properties.ContentAlignment = DevExpress.Utils.HorzAlignment.Near;
            chkAllowEdit.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            chkAllowEdit.Size = new Size(72, 20);
            chkAllowEdit.TabIndex = 2;
            chkAllowEdit.CheckedChanged += chkAllowEdit_CheckedChanged;
            // 
            // labelControl2
            // 
            labelControl2.Location = new Point(12, 33);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(73, 13);
            labelControl2.TabIndex = 94;
            labelControl2.Text = "MRC For Print :";
            // 
            // btnPrintMRC
            // 
            btnPrintMRC.ImageOptions.Image = (Image)resources.GetObject("btnPrintMRC.ImageOptions.Image");
            btnPrintMRC.Location = new Point(337, 25);
            btnPrintMRC.Name = "btnPrintMRC";
            btnPrintMRC.Size = new Size(67, 24);
            btnPrintMRC.TabIndex = 6;
            btnPrintMRC.Text = "Print";
            btnPrintMRC.Click += btnPrintMRC_Click;
            // 
            // ExcelExportBarButtonItem
            // 
            ExcelExportBarButtonItem.Caption = "Excel";
            ExcelExportBarButtonItem.Id = 0;
            ExcelExportBarButtonItem.ImageOptions.Image = Properties.Resources.exporttoxls_16x161;
            ExcelExportBarButtonItem.ImageOptions.LargeImage = Properties.Resources.exporttoxls_16x161;
            ExcelExportBarButtonItem.Name = "ExcelExportBarButtonItem";
            // 
            // frmManageMrc
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1106, 450);
            Controls.Add(panelControl1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Image = (Image)resources.GetObject("frmManageMrc.IconOptions.Image");
            MaximizeBox = false;
            Name = "frmManageMrc";
            Text = "Manage MRC";
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
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl5).EndInit();
            panelControl5.ResumeLayout(false);
            panelControl5.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)chkAllowEdit.Properties).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.PanelControl panelControl3;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn MrcId;
        private DevExpress.XtraGrid.Columns.GridColumn ToCompany;
        private DevExpress.XtraGrid.Columns.GridColumn MrcName;
        private DevExpress.XtraGrid.Columns.GridColumn MrcDescription;
        private DevExpress.XtraGrid.Columns.GridColumn PK;
        private DevExpress.XtraGrid.Columns.GridColumn Description;
        private DevExpress.XtraGrid.Columns.GridColumn Unit;
        private DevExpress.XtraGrid.Columns.GridColumn colEnteredBy;
        private DevExpress.XtraGrid.Columns.GridColumn colEnteredDate;
        private DevExpress.XtraGrid.Columns.GridColumn colEditedBy;
        private DevExpress.XtraGrid.Columns.GridColumn colEditedDate;
        private DevExpress.XtraGrid.Columns.GridColumn ItemOfPk;
        private DevExpress.XtraGrid.Columns.GridColumn Tag;
        private DevExpress.XtraGrid.Columns.GridColumn Qty;
        private DevExpress.XtraGrid.Columns.GridColumn Size1;
        private DevExpress.XtraGrid.Columns.GridColumn Size2;
        private DevExpress.XtraGrid.Columns.GridColumn BatchNo;
        private DevExpress.XtraGrid.Columns.GridColumn DocNo;
        private DevExpress.XtraGrid.Columns.GridColumn Remark;
        private DevExpress.XtraEditors.PanelControl panelControl4;
        private DevExpress.XtraEditors.LookUpEdit lookUpEdit1;
        private DevExpress.XtraEditors.SimpleButton btnRefreshData;
        private DevExpress.XtraEditors.PanelControl panelControl5;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl3;
        private DevExpress.XtraEditors.SimpleButton btnDeleteMRC;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.SimpleButton btnDeleteItem;
        private DevExpress.XtraEditors.CheckEdit chkAllowEdit;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.SimpleButton btnPrintMRC;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraBars.BarButtonItem ExcelExportBarButtonItem;
    }
}