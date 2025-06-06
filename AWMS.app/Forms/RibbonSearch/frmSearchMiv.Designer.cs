﻿namespace AWMS.app.Forms.RibbonSearch
{
    partial class frmSearchMiv
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSearchMiv));
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            ReserveMivQty = new DevExpress.XtraGrid.Columns.GridColumn();
            DelMivQty = new DevExpress.XtraGrid.Columns.GridColumn();
            Balance = new DevExpress.XtraGrid.Columns.GridColumn();
            Inventory = new DevExpress.XtraGrid.Columns.GridColumn();
            Discipline = new DevExpress.XtraGrid.Columns.GridColumn();
            Scope = new DevExpress.XtraGrid.Columns.GridColumn();
            repositoryItemLookUpEditirn = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemLookUpEditpo = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemLookUpEditmr = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemLookUpEditsupplier = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemLookUpEditscope = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemLookUpEditdescipline = new DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit();
            repositoryItemTextEditirn = new DevExpress.XtraEditors.Repository.RepositoryItemTextEdit();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            btnRefreshArchiveNO = new DevExpress.XtraEditors.SimpleButton();
            ReqMivQty = new DevExpress.XtraGrid.Columns.GridColumn();
            QtyInLoc = new DevExpress.XtraGrid.Columns.GridColumn();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            RowNumber = new DevExpress.XtraGrid.Columns.GridColumn();
            ArrivalDate = new DevExpress.XtraGrid.Columns.GridColumn();
            MRCNO = new DevExpress.XtraGrid.Columns.GridColumn();
            RequestNO = new DevExpress.XtraGrid.Columns.GridColumn();
            ReqDate = new DevExpress.XtraGrid.Columns.GridColumn();
            ReqLocItemID = new DevExpress.XtraGrid.Columns.GridColumn();
            Project = new DevExpress.XtraGrid.Columns.GridColumn();
            LocItemID = new DevExpress.XtraGrid.Columns.GridColumn();
            LocationName = new DevExpress.XtraGrid.Columns.GridColumn();
            PoName = new DevExpress.XtraGrid.Columns.GridColumn();
            Supplier = new DevExpress.XtraGrid.Columns.GridColumn();
            Vendor = new DevExpress.XtraGrid.Columns.GridColumn();
            IRN = new DevExpress.XtraGrid.Columns.GridColumn();
            ItemId = new DevExpress.XtraGrid.Columns.GridColumn();
            PLName = new DevExpress.XtraGrid.Columns.GridColumn();
            PK = new DevExpress.XtraGrid.Columns.GridColumn();
            Tag = new DevExpress.XtraGrid.Columns.GridColumn();
            Description = new DevExpress.XtraGrid.Columns.GridColumn();
            UnitName = new DevExpress.XtraGrid.Columns.GridColumn();
            QtyPl = new DevExpress.XtraGrid.Columns.GridColumn();
            IssuedBy = new DevExpress.XtraGrid.Columns.GridColumn();
            ContractNumber = new DevExpress.XtraGrid.Columns.GridColumn();
            CompanyName = new DevExpress.XtraGrid.Columns.GridColumn();
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            panelControl3 = new DevExpress.XtraEditors.PanelControl();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditirn).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditpo).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditmr).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditsupplier).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditscope).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditdescipline).BeginInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemTextEditirn).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl3).BeginInit();
            panelControl3.SuspendLayout();
            SuspendLayout();
            // 
            // labelControl4
            // 
            labelControl4.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            labelControl4.Appearance.BackColor = Color.LimeGreen;
            labelControl4.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl4.Appearance.ForeColor = Color.Transparent;
            labelControl4.Appearance.Options.UseBackColor = true;
            labelControl4.Appearance.Options.UseFont = true;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.LineColor = Color.FromArgb(255, 128, 0);
            labelControl4.Location = new Point(828, 10);
            labelControl4.Margin = new Padding(3, 2, 3, 2);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(80, 14);
            labelControl4.TabIndex = 140;
            labelControl4.Text = "Refresh Data";
            labelControl4.Click += labelControl4_Click_1;
            // 
            // ReserveMivQty
            // 
            ReserveMivQty.Caption = "Reserve MivQty";
            ReserveMivQty.FieldName = "ReserveMivQty";
            ReserveMivQty.MinWidth = 21;
            ReserveMivQty.Name = "ReserveMivQty";
            ReserveMivQty.Visible = true;
            ReserveMivQty.VisibleIndex = 17;
            ReserveMivQty.Width = 81;
            // 
            // DelMivQty
            // 
            DelMivQty.Caption = "Del MivQty";
            DelMivQty.FieldName = "DelMivQty";
            DelMivQty.MinWidth = 21;
            DelMivQty.Name = "DelMivQty";
            DelMivQty.Visible = true;
            DelMivQty.VisibleIndex = 18;
            DelMivQty.Width = 81;
            // 
            // Balance
            // 
            Balance.Caption = "Balance";
            Balance.FieldName = "Balance";
            Balance.MinWidth = 21;
            Balance.Name = "Balance";
            Balance.Visible = true;
            Balance.VisibleIndex = 19;
            Balance.Width = 81;
            // 
            // Inventory
            // 
            Inventory.Caption = "Inventory";
            Inventory.FieldName = "Inventory";
            Inventory.MinWidth = 21;
            Inventory.Name = "Inventory";
            Inventory.Visible = true;
            Inventory.VisibleIndex = 20;
            Inventory.Width = 81;
            // 
            // Discipline
            // 
            Discipline.Caption = "Descipline";
            Discipline.FieldName = "Discipline";
            Discipline.MinWidth = 21;
            Discipline.Name = "Discipline";
            Discipline.Visible = true;
            Discipline.VisibleIndex = 6;
            Discipline.Width = 127;
            // 
            // Scope
            // 
            Scope.Caption = "Scope";
            Scope.FieldName = "Scope";
            Scope.MinWidth = 21;
            Scope.Name = "Scope";
            Scope.Visible = true;
            Scope.VisibleIndex = 7;
            Scope.Width = 144;
            // 
            // repositoryItemLookUpEditirn
            // 
            repositoryItemLookUpEditirn.AutoHeight = false;
            repositoryItemLookUpEditirn.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditirn.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("IrnId", "Irn Id", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("IrnName", "Irn Name", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditirn.DisplayMember = "IrnName";
            repositoryItemLookUpEditirn.Name = "repositoryItemLookUpEditirn";
            repositoryItemLookUpEditirn.ValueMember = "IrnId";
            // 
            // repositoryItemLookUpEditpo
            // 
            repositoryItemLookUpEditpo.AutoHeight = false;
            repositoryItemLookUpEditpo.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditpo.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("PoId", "Po Id", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("PoName", "Po Name", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditpo.DisplayMember = "PoName";
            repositoryItemLookUpEditpo.Name = "repositoryItemLookUpEditpo";
            repositoryItemLookUpEditpo.ValueMember = "PoId";
            // 
            // repositoryItemLookUpEditmr
            // 
            repositoryItemLookUpEditmr.AutoHeight = false;
            repositoryItemLookUpEditmr.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditmr.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("MrId", "MrId", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("MrName", "MrName", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditmr.DisplayMember = "MrName";
            repositoryItemLookUpEditmr.Name = "repositoryItemLookUpEditmr";
            repositoryItemLookUpEditmr.ValueMember = "MrId";
            // 
            // repositoryItemLookUpEditsupplier
            // 
            repositoryItemLookUpEditsupplier.AutoHeight = false;
            repositoryItemLookUpEditsupplier.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditsupplier.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("SupplierId", "Supplier Id", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("SupplierName", "SupplierName", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditsupplier.DisplayMember = "SupplierName";
            repositoryItemLookUpEditsupplier.Name = "repositoryItemLookUpEditsupplier";
            repositoryItemLookUpEditsupplier.ValueMember = "SupplierId";
            // 
            // repositoryItemLookUpEditscope
            // 
            repositoryItemLookUpEditscope.AutoHeight = false;
            repositoryItemLookUpEditscope.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditscope.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("ScopeID", "Scope ID", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("ScopeName", "ScopeName", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditscope.DisplayMember = "ScopeName";
            repositoryItemLookUpEditscope.Name = "repositoryItemLookUpEditscope";
            repositoryItemLookUpEditscope.ValueMember = "ScopeID";
            // 
            // repositoryItemLookUpEditdescipline
            // 
            repositoryItemLookUpEditdescipline.AutoHeight = false;
            repositoryItemLookUpEditdescipline.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            repositoryItemLookUpEditdescipline.Columns.AddRange(new DevExpress.XtraEditors.Controls.LookUpColumnInfo[] { new DevExpress.XtraEditors.Controls.LookUpColumnInfo("DesciplineId", "DesciplineId", 17, DevExpress.Utils.FormatType.None, "", false, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default), new DevExpress.XtraEditors.Controls.LookUpColumnInfo("DesciplineName", "DesciplineName", 17, DevExpress.Utils.FormatType.None, "", true, DevExpress.Utils.HorzAlignment.Default, DevExpress.Data.ColumnSortOrder.None, DevExpress.Utils.DefaultBoolean.Default) });
            repositoryItemLookUpEditdescipline.DisplayMember = "DesciplineName";
            repositoryItemLookUpEditdescipline.Name = "repositoryItemLookUpEditdescipline";
            repositoryItemLookUpEditdescipline.ValueMember = "DesciplineId";
            // 
            // repositoryItemTextEditirn
            // 
            repositoryItemTextEditirn.Name = "repositoryItemTextEditirn";
            // 
            // panelControl2
            // 
            panelControl2.Controls.Add(labelControl2);
            panelControl2.Controls.Add(labelControl1);
            panelControl2.Controls.Add(simpleButton1);
            panelControl2.Controls.Add(labelControl4);
            panelControl2.Controls.Add(btnRefreshArchiveNO);
            panelControl2.Dock = DockStyle.Top;
            panelControl2.Location = new Point(2, 2);
            panelControl2.Margin = new Padding(3, 2, 3, 2);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(955, 33);
            panelControl2.TabIndex = 1;
            // 
            // labelControl2
            // 
            labelControl2.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl2.Appearance.ForeColor = Color.Transparent;
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Appearance.Options.UseForeColor = true;
            labelControl2.ImageOptions.Image = (Image)resources.GetObject("labelControl2.ImageOptions.Image");
            labelControl2.LineColor = Color.FromArgb(255, 128, 0);
            labelControl2.Location = new Point(17, 9);
            labelControl2.Margin = new Padding(3, 2, 3, 2);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(16, 16);
            labelControl2.TabIndex = 145;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.BackColor = Color.Ivory;
            labelControl1.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl1.Appearance.ForeColor = Color.DimGray;
            labelControl1.Appearance.Options.UseBackColor = true;
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Appearance.Options.UseForeColor = true;
            labelControl1.LineColor = Color.FromArgb(255, 128, 0);
            labelControl1.Location = new Point(38, 10);
            labelControl1.Margin = new Padding(3, 2, 3, 2);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(219, 14);
            labelControl1.TabIndex = 144;
            labelControl1.Text = "Search Miv (Material Issue Voucher)";
            // 
            // simpleButton1
            // 
            simpleButton1.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            simpleButton1.ImageOptions.Image = (Image)resources.GetObject("simpleButton1.ImageOptions.Image");
            simpleButton1.Location = new Point(925, 8);
            simpleButton1.Margin = new Padding(3, 2, 3, 2);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.Size = new Size(20, 19);
            simpleButton1.TabIndex = 141;
            simpleButton1.ToolTip = "EXPORT EXCEL";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // btnRefreshArchiveNO
            // 
            btnRefreshArchiveNO.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnRefreshArchiveNO.ImageOptions.Image = (Image)resources.GetObject("btnRefreshArchiveNO.ImageOptions.Image");
            btnRefreshArchiveNO.Location = new Point(803, 8);
            btnRefreshArchiveNO.Margin = new Padding(3, 2, 3, 2);
            btnRefreshArchiveNO.Name = "btnRefreshArchiveNO";
            btnRefreshArchiveNO.Size = new Size(21, 19);
            btnRefreshArchiveNO.TabIndex = 139;
            btnRefreshArchiveNO.Click += btnRefreshArchiveNO_Click;
            // 
            // ReqMivQty
            // 
            ReqMivQty.Caption = "Req MivQty";
            ReqMivQty.FieldName = "ReqMivQty";
            ReqMivQty.MinWidth = 21;
            ReqMivQty.Name = "ReqMivQty";
            ReqMivQty.Visible = true;
            ReqMivQty.VisibleIndex = 16;
            ReqMivQty.Width = 81;
            // 
            // QtyInLoc
            // 
            QtyInLoc.Caption = "Qty in Location";
            QtyInLoc.FieldName = "QtyInLoc";
            QtyInLoc.MinWidth = 21;
            QtyInLoc.Name = "QtyInLoc";
            QtyInLoc.Width = 98;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.EmbeddedNavigator.Appearance.BorderColor = Color.Silver;
            gridControl1.EmbeddedNavigator.Appearance.Options.UseBorderColor = true;
            gridControl1.EmbeddedNavigator.Margin = new Padding(3, 2, 3, 2);
            gridControl1.Location = new Point(2, 2);
            gridControl1.MainView = gridView1;
            gridControl1.Margin = new Padding(3, 2, 3, 2);
            gridControl1.Name = "gridControl1";
            gridControl1.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] { repositoryItemLookUpEditirn, repositoryItemLookUpEditpo, repositoryItemLookUpEditmr, repositoryItemLookUpEditsupplier, repositoryItemLookUpEditscope, repositoryItemLookUpEditdescipline, repositoryItemTextEditirn });
            gridControl1.Size = new Size(951, 533);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.Appearance.EvenRow.BackColor = Color.FromArgb(192, 192, 255);
            gridView1.Appearance.EvenRow.Options.UseBackColor = true;
            gridView1.Appearance.GroupRow.BackColor = Color.FromArgb(192, 255, 255);
            gridView1.Appearance.GroupRow.Options.UseBackColor = true;
            gridView1.Appearance.HeaderPanel.BackColor = Color.LightGreen;
            gridView1.Appearance.HeaderPanel.BorderColor = Color.Gray;
            gridView1.Appearance.HeaderPanel.Options.UseBackColor = true;
            gridView1.Appearance.HeaderPanel.Options.UseBorderColor = true;
            gridView1.Appearance.HeaderPanel.Options.UseFont = true;
            gridView1.Appearance.HeaderPanel.Options.UseForeColor = true;
            gridView1.Appearance.HeaderPanel.Options.UseTextOptions = true;
            gridView1.Appearance.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.HeaderPanel.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Appearance.Row.Options.UseTextOptions = true;
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] { RowNumber, ArrivalDate, MRCNO, RequestNO, ReqDate, ReqLocItemID, Project, LocItemID, LocationName, PoName, Supplier, Vendor, IRN, ItemId, PLName, PK, Tag, Description, UnitName, QtyPl, QtyInLoc, ReqMivQty, ReserveMivQty, DelMivQty, IssuedBy, Balance, Inventory, Discipline, Scope, ContractNumber, CompanyName });
            gridView1.DetailHeight = 284;
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsEditForm.PopupEditFormWidth = 686;
            gridView1.OptionsView.ColumnAutoWidth = false;
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowFooter = true;
            gridView1.CustomUnboundColumnData += gridView1_CustomUnboundColumnData_1;
            // 
            // RowNumber
            // 
            RowNumber.Caption = "#";
            RowNumber.FieldName = "RowNumber";
            RowNumber.MinWidth = 21;
            RowNumber.Name = "RowNumber";
            RowNumber.UnboundDataType = typeof(int);
            RowNumber.Visible = true;
            RowNumber.VisibleIndex = 0;
            RowNumber.Width = 45;
            // 
            // ArrivalDate
            // 
            ArrivalDate.Caption = "Arrival Date";
            ArrivalDate.FieldName = "ArrivalDate";
            ArrivalDate.MinWidth = 21;
            ArrivalDate.Name = "ArrivalDate";
            ArrivalDate.Width = 81;
            // 
            // MRCNO
            // 
            MRCNO.Caption = "MRC NO";
            MRCNO.FieldName = "MRCNO";
            MRCNO.MinWidth = 21;
            MRCNO.Name = "MRCNO";
            MRCNO.Visible = true;
            MRCNO.VisibleIndex = 4;
            MRCNO.Width = 81;
            // 
            // RequestNO
            // 
            RequestNO.Caption = "RequestNO";
            RequestNO.FieldName = "RequestNO";
            RequestNO.Name = "RequestNO";
            RequestNO.Visible = true;
            RequestNO.VisibleIndex = 5;
            // 
            // ReqDate
            // 
            ReqDate.Caption = "Req Date";
            ReqDate.FieldName = "ReqDate";
            ReqDate.Name = "ReqDate";
            ReqDate.Visible = true;
            ReqDate.VisibleIndex = 1;
            // 
            // ReqLocItemID
            // 
            ReqLocItemID.Caption = "ReqLocItemID";
            ReqLocItemID.FieldName = "ReqLocItemID";
            ReqLocItemID.Name = "ReqLocItemID";
            // 
            // Project
            // 
            Project.Caption = "Project";
            Project.FieldName = "Project";
            Project.MinWidth = 21;
            Project.Name = "Project";
            Project.Width = 81;
            // 
            // LocItemID
            // 
            LocItemID.Caption = "LocItemID";
            LocItemID.FieldName = "LocItemID";
            LocItemID.Name = "LocItemID";
            LocItemID.Visible = true;
            LocItemID.VisibleIndex = 10;
            // 
            // LocationName
            // 
            LocationName.Caption = "Location";
            LocationName.FieldName = "LocationName";
            LocationName.Name = "LocationName";
            // 
            // PoName
            // 
            PoName.Caption = "Po";
            PoName.FieldName = "PoName";
            PoName.MinWidth = 21;
            PoName.Name = "PoName";
            PoName.Visible = true;
            PoName.VisibleIndex = 8;
            PoName.Width = 158;
            // 
            // Supplier
            // 
            Supplier.Caption = "Supplier";
            Supplier.FieldName = "Supplier";
            Supplier.MinWidth = 21;
            Supplier.Name = "Supplier";
            Supplier.Width = 81;
            // 
            // Vendor
            // 
            Vendor.Caption = "Vendor";
            Vendor.FieldName = "Vendor";
            Vendor.MinWidth = 21;
            Vendor.Name = "Vendor";
            Vendor.Width = 81;
            // 
            // IRN
            // 
            IRN.Caption = "IRN";
            IRN.FieldName = "IRN";
            IRN.MinWidth = 21;
            IRN.Name = "IRN";
            IRN.Width = 81;
            // 
            // ItemId
            // 
            ItemId.Caption = "Item Id";
            ItemId.FieldName = "ItemId";
            ItemId.MinWidth = 21;
            ItemId.Name = "ItemId";
            ItemId.Visible = true;
            ItemId.VisibleIndex = 9;
            ItemId.Width = 69;
            // 
            // PLName
            // 
            PLName.Caption = "PL";
            PLName.FieldName = "PLName";
            PLName.MinWidth = 21;
            PLName.Name = "PLName";
            PLName.Visible = true;
            PLName.VisibleIndex = 11;
            PLName.Width = 158;
            // 
            // PK
            // 
            PK.Caption = "PK";
            PK.FieldName = "PK";
            PK.MinWidth = 21;
            PK.Name = "PK";
            PK.Visible = true;
            PK.VisibleIndex = 12;
            PK.Width = 81;
            // 
            // Tag
            // 
            Tag.Caption = "Tag";
            Tag.FieldName = "Tag";
            Tag.MinWidth = 21;
            Tag.Name = "Tag";
            Tag.Visible = true;
            Tag.VisibleIndex = 13;
            Tag.Width = 81;
            // 
            // Description
            // 
            Description.AppearanceCell.Options.UseTextOptions = true;
            Description.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near;
            Description.AppearanceCell.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            Description.Caption = "Description";
            Description.FieldName = "Description";
            Description.MinWidth = 21;
            Description.Name = "Description";
            Description.Visible = true;
            Description.VisibleIndex = 14;
            Description.Width = 279;
            // 
            // UnitName
            // 
            UnitName.Caption = "Unit";
            UnitName.FieldName = "UnitName";
            UnitName.MinWidth = 21;
            UnitName.Name = "UnitName";
            UnitName.Visible = true;
            UnitName.VisibleIndex = 15;
            UnitName.Width = 81;
            // 
            // QtyPl
            // 
            QtyPl.Caption = "Qty PL";
            QtyPl.FieldName = "QtyPl";
            QtyPl.MinWidth = 21;
            QtyPl.Name = "QtyPl";
            QtyPl.Width = 81;
            // 
            // IssuedBy
            // 
            IssuedBy.Caption = "IssuedBy";
            IssuedBy.FieldName = "IssuedBy";
            IssuedBy.Name = "IssuedBy";
            // 
            // ContractNumber
            // 
            ContractNumber.Caption = "ContractNumber";
            ContractNumber.FieldName = "ContractNumber";
            ContractNumber.Name = "ContractNumber";
            ContractNumber.Visible = true;
            ContractNumber.VisibleIndex = 3;
            // 
            // CompanyName
            // 
            CompanyName.Caption = "CompanyName";
            CompanyName.FieldName = "CompanyName";
            CompanyName.Name = "CompanyName";
            CompanyName.Visible = true;
            CompanyName.VisibleIndex = 2;
            // 
            // panelControl1
            // 
            panelControl1.Controls.Add(panelControl3);
            panelControl1.Controls.Add(panelControl2);
            panelControl1.Dock = DockStyle.Fill;
            panelControl1.Location = new Point(0, 0);
            panelControl1.Margin = new Padding(3, 2, 3, 2);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(959, 574);
            panelControl1.TabIndex = 1;
            // 
            // panelControl3
            // 
            panelControl3.Controls.Add(gridControl1);
            panelControl3.Dock = DockStyle.Fill;
            panelControl3.Location = new Point(2, 35);
            panelControl3.Margin = new Padding(3, 2, 3, 2);
            panelControl3.Name = "panelControl3";
            panelControl3.Size = new Size(955, 537);
            panelControl3.TabIndex = 2;
            // 
            // frmSearchMiv
            // 
            Appearance.Options.UseFont = true;
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(959, 574);
            Controls.Add(panelControl1);
            IconOptions.Image = (Image)resources.GetObject("frmSearchMiv.IconOptions.Image");
            IconOptions.LargeImage = (Image)resources.GetObject("frmSearchMiv.IconOptions.LargeImage");
            Margin = new Padding(3, 2, 3, 2);
            Name = "frmSearchMiv";
            Text = "Search Miv";
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditirn).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditpo).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditmr).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditsupplier).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditscope).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemLookUpEditdescipline).EndInit();
            ((System.ComponentModel.ISupportInitialize)repositoryItemTextEditirn).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            panelControl2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl3).EndInit();
            panelControl3.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraGrid.Columns.GridColumn ReserveMivQty;
        private DevExpress.XtraGrid.Columns.GridColumn DelMivQty;
        private DevExpress.XtraGrid.Columns.GridColumn TotalReturnAcceptQty;
        private DevExpress.XtraGrid.Columns.GridColumn Balance;
        private DevExpress.XtraGrid.Columns.GridColumn Inventory;
        private DevExpress.XtraGrid.Columns.GridColumn RejectQty;
        private DevExpress.XtraGrid.Columns.GridColumn NISQty;
        private DevExpress.XtraGrid.Columns.GridColumn Discipline;
        private DevExpress.XtraGrid.Columns.GridColumn Scope;
        private DevExpress.XtraGrid.Columns.GridColumn QtyinLocWithMRV;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditirn;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditpo;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditmr;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditsupplier;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditscope;
        private DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit repositoryItemLookUpEditdescipline;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit repositoryItemTextEditirn;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.SimpleButton btnRefreshArchiveNO;
        private DevExpress.XtraGrid.Columns.GridColumn ReqMivQty;
        private DevExpress.XtraGrid.Columns.GridColumn QtyInLoc;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn RowNumber;
        private DevExpress.XtraGrid.Columns.GridColumn ArrivalDate;
        private DevExpress.XtraGrid.Columns.GridColumn MRCNO;
        private DevExpress.XtraGrid.Columns.GridColumn PLNO;
        private DevExpress.XtraGrid.Columns.GridColumn OPINO;
        private DevExpress.XtraGrid.Columns.GridColumn Project;
        private DevExpress.XtraGrid.Columns.GridColumn EnteredDate;
        private DevExpress.XtraGrid.Columns.GridColumn MARDate;
        private DevExpress.XtraGrid.Columns.GridColumn PoName;
        private DevExpress.XtraGrid.Columns.GridColumn Supplier;
        private DevExpress.XtraGrid.Columns.GridColumn Vendor;
        private DevExpress.XtraGrid.Columns.GridColumn Mr;
        private DevExpress.XtraGrid.Columns.GridColumn IRN;
        private DevExpress.XtraGrid.Columns.GridColumn ItemId;
        private DevExpress.XtraGrid.Columns.GridColumn PLName;
        private DevExpress.XtraGrid.Columns.GridColumn ArchiveNO;
        private DevExpress.XtraGrid.Columns.GridColumn PK;
        private DevExpress.XtraGrid.Columns.GridColumn Tag;
        private DevExpress.XtraGrid.Columns.GridColumn Description;
        private DevExpress.XtraGrid.Columns.GridColumn UnitName;
        private DevExpress.XtraGrid.Columns.GridColumn QtyPl;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl3;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraGrid.Columns.GridColumn LocItemID;
        private DevExpress.XtraGrid.Columns.GridColumn LocationName;
        private DevExpress.XtraGrid.Columns.GridColumn ReqDate;
        private DevExpress.XtraGrid.Columns.GridColumn ReqLocItemID;
        private DevExpress.XtraGrid.Columns.GridColumn IssuedBy;
        private DevExpress.XtraGrid.Columns.GridColumn ContractNumber;
        private DevExpress.XtraGrid.Columns.GridColumn CompanyName;
        private DevExpress.XtraGrid.Columns.GridColumn RequestNO;
    }
}