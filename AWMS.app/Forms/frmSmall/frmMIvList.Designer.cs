namespace AWMS.app.Forms.frmSmall
{
    partial class frmMIvList
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMIvList));
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            standaloneBarDockControl1 = new DevExpress.XtraBars.StandaloneBarDockControl();
            sidePanel1 = new DevExpress.XtraEditors.SidePanel();
            simpleButton1 = new DevExpress.XtraEditors.SimpleButton();
            sidePanel2 = new DevExpress.XtraEditors.SidePanel();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            sidePanel1.SuspendLayout();
            sidePanel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            SuspendLayout();
            // 
            // labelControl2
            // 
            labelControl2.Appearance.Font = new Font("Tahoma", 9F, FontStyle.Bold, GraphicsUnit.Point);
            labelControl2.Appearance.ForeColor = Color.Transparent;
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Appearance.Options.UseForeColor = true;
            labelControl2.ImageOptions.Image = (Image)resources.GetObject("labelControl2.ImageOptions.Image");
            labelControl2.LineColor = Color.FromArgb(255, 128, 0);
            labelControl2.Location = new Point(12, 9);
            labelControl2.Margin = new Padding(3, 2, 3, 2);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(32, 32);
            labelControl2.TabIndex = 147;
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
            labelControl1.Location = new Point(50, 18);
            labelControl1.Margin = new Padding(3, 2, 3, 2);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(47, 14);
            labelControl1.TabIndex = 146;
            labelControl1.Text = "Miv List";
            // 
            // standaloneBarDockControl1
            // 
            standaloneBarDockControl1.CausesValidation = false;
            standaloneBarDockControl1.Location = new Point(0, 0);
            standaloneBarDockControl1.Manager = null;
            standaloneBarDockControl1.Name = "standaloneBarDockControl1";
            standaloneBarDockControl1.Size = new Size(0, 0);
            // 
            // sidePanel1
            // 
            sidePanel1.Controls.Add(simpleButton1);
            sidePanel1.Controls.Add(labelControl2);
            sidePanel1.Controls.Add(labelControl1);
            sidePanel1.Dock = DockStyle.Top;
            sidePanel1.Location = new Point(0, 0);
            sidePanel1.Name = "sidePanel1";
            sidePanel1.Size = new Size(1081, 46);
            sidePanel1.TabIndex = 1;
            sidePanel1.Text = "sidePanel1";
            // 
            // simpleButton1
            // 
            simpleButton1.Appearance.BackColor = Color.Transparent;
            simpleButton1.Appearance.BorderColor = Color.Transparent;
            simpleButton1.Appearance.ForeColor = Color.Transparent;
            simpleButton1.Appearance.Options.UseBackColor = true;
            simpleButton1.Appearance.Options.UseBorderColor = true;
            simpleButton1.Appearance.Options.UseForeColor = true;
            simpleButton1.Dock = DockStyle.Right;
            simpleButton1.ImageOptions.Image = (Image)resources.GetObject("simpleButton1.ImageOptions.Image");
            simpleButton1.Location = new Point(1053, 0);
            simpleButton1.Margin = new Padding(3, 2, 3, 2);
            simpleButton1.Name = "simpleButton1";
            simpleButton1.PaintStyle = DevExpress.XtraEditors.Controls.PaintStyles.Light;
            simpleButton1.Size = new Size(28, 45);
            simpleButton1.TabIndex = 148;
            simpleButton1.ToolTip = "EXPORT EXCEL";
            simpleButton1.Click += simpleButton1_Click;
            // 
            // sidePanel2
            // 
            sidePanel2.Controls.Add(gridControl1);
            sidePanel2.Dock = DockStyle.Fill;
            sidePanel2.Location = new Point(0, 46);
            sidePanel2.Name = "sidePanel2";
            sidePanel2.Size = new Size(1081, 404);
            sidePanel2.TabIndex = 2;
            sidePanel2.Text = "sidePanel2";
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(1081, 404);
            gridControl1.TabIndex = 1;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowFooter = true;
            // 
            // frmMIvList
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1081, 450);
            Controls.Add(sidePanel2);
            Controls.Add(sidePanel1);
            Controls.Add(standaloneBarDockControl1);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Image = (Image)resources.GetObject("frmMIvList.IconOptions.Image");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmMIvList";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Miv List";
            sidePanel1.ResumeLayout(false);
            sidePanel1.PerformLayout();
            sidePanel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraBars.StandaloneBarDockControl standaloneBarDockControl1;
        private DevExpress.XtraEditors.SidePanel sidePanel1;
        private DevExpress.XtraEditors.SimpleButton simpleButton1;
        private DevExpress.XtraEditors.SidePanel sidePanel2;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
    }
}