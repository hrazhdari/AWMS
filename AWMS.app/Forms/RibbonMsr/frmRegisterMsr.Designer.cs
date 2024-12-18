namespace AWMS.app.Forms.RibbonMsr
{
    partial class frmRegisterMsr
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmRegisterMsr));
            splitContainerControl2 = new DevExpress.XtraEditors.SplitContainerControl();
            gridControl1 = new DevExpress.XtraGrid.GridControl();
            gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            labelControl6 = new DevExpress.XtraEditors.LabelControl();
            labelControl5 = new DevExpress.XtraEditors.LabelControl();
            labelControl4 = new DevExpress.XtraEditors.LabelControl();
            labelControl1 = new DevExpress.XtraEditors.LabelControl();
            labelControl2 = new DevExpress.XtraEditors.LabelControl();
            registerMsrBtn = new DevExpress.XtraEditors.SimpleButton();
            refreshBtn = new DevExpress.XtraEditors.SimpleButton();
            labelControl3 = new DevExpress.XtraEditors.LabelControl();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).BeginInit();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).BeginInit();
            splitContainerControl2.Panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).BeginInit();
            splitContainerControl2.Panel2.SuspendLayout();
            splitContainerControl2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)gridControl1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).BeginInit();
            SuspendLayout();
            // 
            // splitContainerControl2
            // 
            splitContainerControl2.Dock = DockStyle.Fill;
            splitContainerControl2.Horizontal = false;
            splitContainerControl2.Location = new Point(0, 0);
            splitContainerControl2.Name = "splitContainerControl2";
            // 
            // splitContainerControl2.Panel1
            // 
            splitContainerControl2.Panel1.Appearance.BackColor = Color.FromArgb(192, 192, 255);
            splitContainerControl2.Panel1.Appearance.Options.UseBackColor = true;
            splitContainerControl2.Panel1.AutoScroll = true;
            splitContainerControl2.Panel1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel1.Controls.Add(gridControl1);
            splitContainerControl2.Panel1.Text = "Panel1";
            // 
            // splitContainerControl2.Panel2
            // 
            splitContainerControl2.Panel2.Appearance.BackColor = Color.FromArgb(224, 224, 224);
            splitContainerControl2.Panel2.Appearance.Options.UseBackColor = true;
            splitContainerControl2.Panel2.AutoScroll = true;
            splitContainerControl2.Panel2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            splitContainerControl2.Panel2.Controls.Add(labelControl6);
            splitContainerControl2.Panel2.Controls.Add(labelControl5);
            splitContainerControl2.Panel2.Controls.Add(labelControl4);
            splitContainerControl2.Panel2.Controls.Add(labelControl1);
            splitContainerControl2.Panel2.Controls.Add(labelControl2);
            splitContainerControl2.Panel2.Controls.Add(registerMsrBtn);
            splitContainerControl2.Panel2.Controls.Add(refreshBtn);
            splitContainerControl2.Panel2.Controls.Add(labelControl3);
            splitContainerControl2.Panel2.Text = "Panel2";
            splitContainerControl2.ShowSplitGlyph = DevExpress.Utils.DefaultBoolean.True;
            splitContainerControl2.Size = new Size(1116, 612);
            splitContainerControl2.SplitterPosition = 438;
            splitContainerControl2.TabIndex = 0;
            // 
            // gridControl1
            // 
            gridControl1.Dock = DockStyle.Fill;
            gridControl1.Location = new Point(0, 0);
            gridControl1.MainView = gridView1;
            gridControl1.Margin = new Padding(30);
            gridControl1.Name = "gridControl1";
            gridControl1.Size = new Size(1112, 434);
            gridControl1.TabIndex = 0;
            gridControl1.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] { gridView1 });
            // 
            // gridView1
            // 
            gridView1.GridControl = gridControl1;
            gridView1.Name = "gridView1";
            gridView1.OptionsView.ShowAutoFilterRow = true;
            gridView1.OptionsView.ShowFooter = true;
            // 
            // labelControl6
            // 
            labelControl6.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl6.Appearance.ForeColor = Color.SeaShell;
            labelControl6.Appearance.Options.UseFont = true;
            labelControl6.Appearance.Options.UseForeColor = true;
            labelControl6.Location = new Point(356, 88);
            labelControl6.Name = "labelControl6";
            labelControl6.Size = new Size(0, 23);
            labelControl6.TabIndex = 24;
            // 
            // labelControl5
            // 
            labelControl5.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl5.Appearance.ForeColor = Color.Snow;
            labelControl5.Appearance.Options.UseFont = true;
            labelControl5.Appearance.Options.UseForeColor = true;
            labelControl5.Location = new Point(370, 36);
            labelControl5.Name = "labelControl5";
            labelControl5.Size = new Size(0, 23);
            labelControl5.TabIndex = 23;
            // 
            // labelControl4
            // 
            labelControl4.Appearance.Font = new Font("Tahoma", 14.25F, FontStyle.Italic, GraphicsUnit.Point);
            labelControl4.Appearance.ForeColor = Color.Snow;
            labelControl4.Appearance.Options.UseFont = true;
            labelControl4.Appearance.Options.UseForeColor = true;
            labelControl4.Location = new Point(632, 57);
            labelControl4.Name = "labelControl4";
            labelControl4.Size = new Size(0, 23);
            labelControl4.TabIndex = 22;
            // 
            // labelControl1
            // 
            labelControl1.Appearance.Font = new Font("Tahoma", 18F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl1.Appearance.ForeColor = Color.Coral;
            labelControl1.Appearance.Options.UseFont = true;
            labelControl1.Appearance.Options.UseForeColor = true;
            labelControl1.Location = new Point(473, 88);
            labelControl1.Name = "labelControl1";
            labelControl1.Size = new Size(0, 29);
            labelControl1.TabIndex = 20;
            // 
            // labelControl2
            // 
            labelControl2.Appearance.BackColor = Color.Transparent;
            labelControl2.Appearance.Font = new Font("Tahoma", 21.75F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl2.Appearance.ForeColor = Color.OrangeRed;
            labelControl2.Appearance.Options.UseBackColor = true;
            labelControl2.Appearance.Options.UseFont = true;
            labelControl2.Appearance.Options.UseForeColor = true;
            labelControl2.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            labelControl2.Location = new Point(425, 57);
            labelControl2.Name = "labelControl2";
            labelControl2.Size = new Size(0, 35);
            labelControl2.TabIndex = 2;
            // 
            // registerMsrBtn
            // 
            registerMsrBtn.Appearance.BackColor = Color.FromArgb(255, 192, 128);
            registerMsrBtn.Appearance.Font = new Font("Tahoma", 12F, FontStyle.Bold, GraphicsUnit.Point);
            registerMsrBtn.Appearance.ForeColor = Color.Black;
            registerMsrBtn.Appearance.Options.UseBackColor = true;
            registerMsrBtn.Appearance.Options.UseFont = true;
            registerMsrBtn.Appearance.Options.UseForeColor = true;
            registerMsrBtn.ImageOptions.Image = (Image)resources.GetObject("registerMsrBtn.ImageOptions.Image");
            registerMsrBtn.Location = new Point(25, 53);
            registerMsrBtn.Name = "registerMsrBtn";
            registerMsrBtn.Size = new Size(181, 73);
            registerMsrBtn.TabIndex = 0;
            registerMsrBtn.Text = "Register MSR";
            registerMsrBtn.Click += registerMsrBtn_Click;
            // 
            // refreshBtn
            // 
            refreshBtn.Appearance.BackColor = Color.FromArgb(192, 255, 192);
            refreshBtn.Appearance.Options.UseBackColor = true;
            refreshBtn.ImageOptions.Image = (Image)resources.GetObject("refreshBtn.ImageOptions.Image");
            refreshBtn.Location = new Point(25, 13);
            refreshBtn.Name = "refreshBtn";
            refreshBtn.Size = new Size(181, 34);
            refreshBtn.TabIndex = 19;
            refreshBtn.Text = "Refresh Grid Data";
            refreshBtn.Click += refreshBtn_Click;
            // 
            // labelControl3
            // 
            labelControl3.Appearance.Font = new Font("Tahoma", 21.75F, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Point);
            labelControl3.Appearance.ForeColor = Color.MistyRose;
            labelControl3.Appearance.Options.UseFont = true;
            labelControl3.Appearance.Options.UseForeColor = true;
            labelControl3.Location = new Point(488, 26);
            labelControl3.Name = "labelControl3";
            labelControl3.Size = new Size(0, 35);
            labelControl3.TabIndex = 21;
            // 
            // frmRegisterMsr
            // 
            AutoScaleDimensions = new SizeF(6F, 13F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1116, 612);
            Controls.Add(splitContainerControl2);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            IconOptions.Icon = (Icon)resources.GetObject("frmRegisterMsr.IconOptions.Icon");
            IconOptions.Image = (Image)resources.GetObject("frmRegisterMsr.IconOptions.Image");
            MaximizeBox = false;
            Name = "frmRegisterMsr";
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Register MSR";
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel1).EndInit();
            splitContainerControl2.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2.Panel2).EndInit();
            splitContainerControl2.Panel2.ResumeLayout(false);
            splitContainerControl2.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)splitContainerControl2).EndInit();
            splitContainerControl2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)gridControl1).EndInit();
            ((System.ComponentModel.ISupportInitialize)gridView1).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl1;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl2;
        private DevExpress.XtraGrid.GridControl gridControl1;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private DevExpress.XtraEditors.SimpleButton registerMsrBtn;
        private DevExpress.XtraEditors.SimpleButton refreshBtn;
        private DevExpress.XtraEditors.LabelControl labelControl6;
        private DevExpress.XtraEditors.LabelControl labelControl5;
        private DevExpress.XtraEditors.LabelControl labelControl4;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl3;
    }
}