namespace AWMS.app.Forms.frmSmall
{
    partial class frmUpload
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmUpload));
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            btnUpload = new DevExpress.XtraEditors.SimpleButton();
            btnSelect = new DevExpress.XtraEditors.SimpleButton();
            radioGroup1 = new DevExpress.XtraEditors.RadioGroup();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            RowNumber = new DevExpress.XtraGrid.Columns.GridColumn();
            FileName = new DevExpress.XtraGrid.Columns.GridColumn();
            Status = new DevExpress.XtraGrid.Columns.GridColumn();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)radioGroup1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            SuspendLayout();
            // 
            // panelControl1
            // 
            panelControl1.Appearance.BackColor = Color.LightBlue;
            panelControl1.Appearance.Options.UseBackColor = true;
            panelControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            panelControl1.Controls.Add(btnUpload);
            panelControl1.Controls.Add(btnSelect);
            panelControl1.Controls.Add(radioGroup1);
            panelControl1.Dock = DockStyle.Top;
            panelControl1.Location = new Point(0, 0);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(1023, 48);
            panelControl1.TabIndex = 0;
            // 
            // btnUpload
            // 
            btnUpload.ImageOptions.Image = (Image)resources.GetObject("btnUpload.ImageOptions.Image");
            btnUpload.Location = new Point(529, 9);
            btnUpload.Name = "btnUpload";
            btnUpload.Size = new Size(104, 31);
            btnUpload.TabIndex = 2;
            btnUpload.Text = "Upload";
            btnUpload.Click += btnUpload_Click;
            // 
            // btnSelect
            // 
            btnSelect.ImageOptions.Image = (Image)resources.GetObject("btnSelect.ImageOptions.Image");
            btnSelect.Location = new Point(407, 9);
            btnSelect.Name = "btnSelect";
            btnSelect.Size = new Size(104, 31);
            btnSelect.TabIndex = 1;
            btnSelect.Text = "Select File's";
            btnSelect.Click += btnSelect_Click;
            // 
            // radioGroup1
            // 
            radioGroup1.Location = new Point(9, 9);
            radioGroup1.Name = "radioGroup1";
            radioGroup1.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] { new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "PL", true, null, "PL"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "IRN", true, null, "IRN"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "MIV", true, null, "MIV"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "MSR", true, null, "MSR"), new DevExpress.XtraEditors.Controls.RadioGroupItem(null, "IVR", true, null, "IVR") });
            radioGroup1.Size = new Size(354, 31);
            radioGroup1.TabIndex = 0;
            // 
            // panelControl2
            // 
            panelControl2.Controls.Add(gridControl1);
            panelControl2.Location = new Point(0, 46);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(1023, 503);
            panelControl2.TabIndex = 1;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(2, 2);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(1019, 499);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.Appearance.HeaderPanel.Options.UseTextOptions = true;
            gridView1.Appearance.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.HeaderPanel.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] { RowNumber, FileName, Status });
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowFooter = true;
            gridView1.OptionsView.ShowGroupPanel = false;
            // 
            // RowNumber
            // 
            RowNumber.AppearanceCell.Options.UseTextOptions = true;
            RowNumber.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            RowNumber.AppearanceCell.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            RowNumber.Caption = "#";
            RowNumber.FieldName = "RowNumber";
            RowNumber.Name = "RowNumber";
            RowNumber.Visible = true;
            RowNumber.VisibleIndex = 0;
            RowNumber.Width = 25;
            // 
            // FileName
            // 
            FileName.AppearanceHeader.Options.UseTextOptions = true;
            FileName.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near;
            FileName.AppearanceHeader.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            FileName.Caption = "File Name";
            FileName.FieldName = "FileName";
            FileName.Name = "FileName";
            FileName.Visible = true;
            FileName.VisibleIndex = 1;
            FileName.Width = 544;
            // 
            // Status
            // 
            Status.AppearanceCell.Options.UseTextOptions = true;
            Status.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            Status.AppearanceCell.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            Status.Caption = "Status";
            Status.FieldName = "Status";
            Status.Name = "Status";
            Status.Visible = true;
            Status.VisibleIndex = 2;
            Status.Width = 116;
            // 
            // frmUpload
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1023, 549);
            Controls.Add(panelControl1);
            Controls.Add(panelControl2);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.LargeImage = (Image)resources.GetObject("frmUpload.IconOptions.LargeImage");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmUpload";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Upload File";
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)radioGroup1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.SimpleButton btnUpload;
        private DevExpress.XtraEditors.SimpleButton btnSelect;
        private DevExpress.XtraEditors.RadioGroup radioGroup1;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn RowNumber;
        private DevExpress.XtraGrid.Columns.GridColumn FileName;
        private DevExpress.XtraGrid.Columns.GridColumn Status;
    }
}