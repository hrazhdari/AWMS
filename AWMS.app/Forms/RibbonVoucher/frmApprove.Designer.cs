namespace AWMS.app.Forms.RibbonVoucher
{
    partial class frmApprove
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmApprove));
            splitContainerControl1 = new DevExpress.XtraEditors.SplitContainerControl();
            panelControl2 = new DevExpress.XtraEditors.PanelControl();
            btnFillAll = new DevExpress.XtraEditors.SimpleButton();
            btnZeroAll = new DevExpress.XtraEditors.SimpleButton();
            btnAprrove = new DevExpress.XtraEditors.SimpleButton();
            panelControl1 = new DevExpress.XtraEditors.PanelControl();
            lookUpEdit1 = new DevExpress.XtraEditors.LookUpEdit();
            btnShowMiv = new DevExpress.XtraEditors.SimpleButton();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).BeginInit();
            splitContainerControl1.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).BeginInit();
            splitContainerControl1.Panel2.SuspendLayout();
            splitContainerControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl2).BeginInit();
            panelControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)panelControl1).BeginInit();
            panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl1
            // 
            splitContainerControl1.Appearance.BorderColor = Color.Silver;
            splitContainerControl1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Collapsed = true;
            splitContainerControl1.Dock = DockStyle.Fill;
            splitContainerControl1.FixedPanel = DevExpress.XtraEditors.SplitFixedPanel.None;
            splitContainerControl1.Horizontal = false;
            splitContainerControl1.Location = new Point(0, 0);
            splitContainerControl1.Name = "splitContainerControl1";
            // 
            // splitContainerControl1.Panel1
            // 
            splitContainerControl1.Panel1.Appearance.BorderColor = Color.Silver;
            splitContainerControl1.Panel1.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel1.Controls.Add(panelControl2);
            splitContainerControl1.Panel1.Controls.Add(panelControl1);
            splitContainerControl1.Panel1.Text = "Panel1";
            // 
            // splitContainerControl1.Panel2
            // 
            splitContainerControl1.Panel2.Appearance.BorderColor = Color.Silver;
            splitContainerControl1.Panel2.Appearance.Options.UseBorderColor = true;
            splitContainerControl1.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl1.Panel2.Controls.Add(gridControl1);
            splitContainerControl1.Panel2.Text = "Panel2";
            splitContainerControl1.Size = new Size(876, 500);
            splitContainerControl1.SplitterPosition = 85;
            splitContainerControl1.TabIndex = 0;
            // 
            // panelControl2
            // 
            panelControl2.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            panelControl2.Controls.Add(btnFillAll);
            panelControl2.Controls.Add(btnZeroAll);
            panelControl2.Controls.Add(btnAprrove);
            panelControl2.Location = new Point(673, 3);
            panelControl2.Name = "panelControl2";
            panelControl2.Size = new Size(187, 75);
            panelControl2.TabIndex = 5;
            // 
            // btnFillAll
            // 
            btnFillAll.Appearance.BackColor = Color.FromArgb(192, 255, 255);
            btnFillAll.Appearance.Options.UseBackColor = true;
            btnFillAll.Location = new Point(5, 45);
            btnFillAll.Name = "btnFillAll";
            btnFillAll.Size = new Size(75, 23);
            btnFillAll.TabIndex = 2;
            btnFillAll.Text = "FILL ALL";
            btnFillAll.Click += btnFillAll_Click;
            // 
            // btnZeroAll
            // 
            btnZeroAll.Appearance.BackColor = Color.FromArgb(255, 192, 192);
            btnZeroAll.Appearance.Options.UseBackColor = true;
            btnZeroAll.Location = new Point(5, 7);
            btnZeroAll.Name = "btnZeroAll";
            btnZeroAll.Size = new Size(75, 23);
            btnZeroAll.TabIndex = 1;
            btnZeroAll.Text = "Zero ALL";
            btnZeroAll.Click += btnZeroAll_Click;
            // 
            // btnAprrove
            // 
            btnAprrove.Appearance.BackColor = Color.LightGreen;
            btnAprrove.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            btnAprrove.Appearance.Options.UseBackColor = true;
            btnAprrove.Appearance.Options.UseFont = true;
            btnAprrove.ImageOptions.Image = (Image)resources.GetObject("btnAprrove.ImageOptions.Image");
            btnAprrove.Location = new Point(97, 7);
            btnAprrove.Name = "btnAprrove";
            btnAprrove.Size = new Size(83, 61);
            btnAprrove.TabIndex = 0;
            btnAprrove.Text = "Approve";
            btnAprrove.Click += btnAprrove_Click;
            // 
            // panelControl1
            // 
            panelControl1.Appearance.BorderColor = Color.Silver;
            panelControl1.Appearance.Options.UseBorderColor = true;
            panelControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            panelControl1.Controls.Add(lookUpEdit1);
            panelControl1.Controls.Add(btnShowMiv);
            panelControl1.Controls.Add(labelControl2);
            panelControl1.Controls.Add(labelControl1);
            panelControl1.Location = new Point(5, 3);
            panelControl1.Name = "panelControl1";
            panelControl1.Size = new Size(202, 75);
            panelControl1.TabIndex = 4;
            // 
            // lookUpEdit1
            // 
            lookUpEdit1.Location = new Point(61, 23);
            lookUpEdit1.Name = "lookUpEdit1";
            lookUpEdit1.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] { new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo) });
            lookUpEdit1.Size = new Size(123, 20);
            lookUpEdit1.TabIndex = 6;
            // 
            // btnShowMiv
            // 
            btnShowMiv.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            btnShowMiv.Appearance.Options.UseFont = true;
            btnShowMiv.ImageOptions.Image = (Image)resources.GetObject("btnShowMiv.ImageOptions.Image");
            btnShowMiv.Location = new Point(61, 47);
            btnShowMiv.Name = "btnShowMiv";
            btnShowMiv.Size = new Size(123, 23);
            btnShowMiv.TabIndex = 3;
            btnShowMiv.Text = "SHOW MIV";
            btnShowMiv.Click += btnShowMiv_Click;
            // 
            // labelControl2
            // 
            labelControl2.Appearance.BackColor = Color.Transparent;
            labelControl2.Appearance.BorderColor = Color.FromArgb(0, 192, 0);
            labelControl2.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Bold | FontStyle.Underline, GraphicsUnit.Point);
            labelControl2.Appearance.ForeColor = Color.Green;
            labelControl2.Appearance.Options.UseBackColor = true;
            labelControl2.Appearance.Options.UseBorderColor = true;
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Appearance.Options.UseForeColor = true;
            labelControl2.Location = new Point(5, 2);
            labelControl2.Name = "labelControl2";
            labelControl2.Padding = new Padding(2);
            labelControl2.Size = new Size(69, 17);
            labelControl2.TabIndex = 2;
            labelControl2.Text = "SELECT MIV";
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 8.25F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Location = new Point(5, 27);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(49, 13);
            labelControl1.TabIndex = 1;
            labelControl1.Text = "MIV.NO : ";
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(868, 397);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowFooter = true;
            gridView1.OptionsView.ShowGroupPanel = false;
            // 
            // frmApprove
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(876, 500);
            Controls.Add(splitContainerControl1);
            IconOptions.Image = (Image)resources.GetObject("frmApprove.IconOptions.Image");
            Name = "frmApprove";
            Text = "Approve MIV";
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel1).EndInit();
            splitContainerControl1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1.Panel2).EndInit();
            splitContainerControl1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl1).EndInit();
            splitContainerControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl2).EndInit();
            panelControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)panelControl1).EndInit();
            panelControl1.ResumeLayout(false);
            panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)lookUpEdit1.Properties).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private DevExpress.XtraEditors.SimpleButton btnShowMiv;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.SimpleButton btnAprrove;
        private DevExpress.XtraEditors.SimpleButton btnZeroAll;
        private DevExpress.XtraEditors.SimpleButton btnFillAll;
        private DevExpress.XtraEditors.LookUpEdit lookUpEdit1;
    }
}